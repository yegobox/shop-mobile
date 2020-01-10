import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/database/moor_database.dart';
import 'package:flutter_scaffold/home/screen_argument_product_details.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/services/products.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../config.dart';
import 'drawer.dart';

class ProductCategorySpecific extends StatefulWidget {
  @override
  _ProductCategorySpecificState createState() =>
      _ProductCategorySpecificState();
}

class _ProductCategorySpecificState extends State<ProductCategorySpecific> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  List<String> imgList = List<String>();
  TextEditingController _controller = new TextEditingController();
  Products products;

  int cartCount = 0;

  bool _storagePermissionGranted = false;

  bool _recordPermissionGranted = false;

  String _fileName;

  String _storagePath;
  loadHeaderImages() async {
    try {
      final ScreenArgumentsProducts args =
          ModalRoute.of(context).settings.arguments;

      print(args.id);
      final productResponse = await http.get(
          '$BASE_URL/api/products?category_id=' + args.id.toString(),
          headers: {HttpHeaders.acceptHeader: 'application/json'});
      print(productResponse);
      if (productResponse.statusCode == 200) {
        setState(() {
          products = productsFromJson(productResponse.body);
        });
      } else {
        Fluttertoast.showToast(
            msg: 'Error loading products',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            fontSize: 16.0);
      }
    } catch (e) {}
  }

  int _startedRecord = 0;
  PermissionStatus _permissionStatus;

  @override
  void initState() {
    super.initState();
    this.loadHeaderImages();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<CartCountDao>(context);
    return Scaffold(
      floatingActionButton: HoldDetector(
        onHold: _recordAudio,
        onCancel: () {
          _stop();
          setState(() {
            _startedRecord = 0;
            toast("Sending your command...");
          });
          _startUploading();
        },
        holdTimeout: Duration(milliseconds: 200),
        enableHapticFeedback: true,
        child: FloatingActionButton(
          onPressed: _recordAudio,
          child: Icon(Icons.settings_voice),
          backgroundColor: Colors.green,
        ),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                pinned: true,
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'cart');
                    },
                    child: StreamBuilder(
                      stream: dao.watchCount(),
                      builder: (context,
                          AsyncSnapshot<List<CartCountData>> snapshot) {
                        List<CartCountData> carts = snapshot.data ?? List();
                        var _totalCount = 0;
                        if (carts.length > 0) {
                          carts.forEach((data) => {_totalCount += data.count});
                        }
                        return Badge(
                          position: BadgePosition.topLeft(),
                          badgeContent: Text(
                            _totalCount.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          child: Icon(Icons.shopping_cart),
                        );
                      },
                    ),
                  )
                ],
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: 240.0,
                          child: products == null
                              ? Container()
                              : ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: products.data.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 140.0,
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: InkWell(
                                              onTap: () {
                                                final database =
                                                    Provider.of<Database>(
                                                        context);
                                                final cart = CartData(
                                                    refId: i.id,
                                                    price: i.price.toString(),
                                                    name: i.name,
                                                    imageUrl: i.images[0]
                                                        .largeImageUrl,
                                                    quantity: 1);
                                                setState(() {
                                                  //
                                                  database.cartCountDao
                                                      .insertCount(
                                                          CartCountData(
                                                              count: 1));
                                                });
                                                database.cartDao
                                                    .isRowExist(i.id)
                                                    .listen((data) => {
                                                          if (data.length == 0)
                                                            {
                                                              database.cartDao
                                                                  .insertCart(
                                                                      cart)
                                                            }
                                                          else
                                                            {}
                                                        });
                                                toast("added to cart");
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 160,
                                                    child: Hero(
                                                      tag: i
                                                          .name, //TODO: work on this hero's to find out if all is well.
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: i.images[0]
                                                            .largeImageUrl,
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            new Icon(
                                                                Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      i.name,
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    subtitle: Text(
                                                        "N " +
                                                            i.price.toString(),
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .accentColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/banner-2.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _recordAudio() async {
    if (_startedRecord == 1) {
      toast("Recording");
    }
    setState(() {
      _startedRecord += 1;
    });

    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage)
        .then(_checkStoragePermission);

    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage)
        .then(_checkRecordPermission);

    if (_recordPermissionGranted && _storagePermissionGranted) {
      if (_startedRecord == 2) {
        try {
          if (await AudioRecorder.hasPermissions) {
            if (_controller.text != null && _controller.text != "") {
              String path = getPath();

              bool isRecording = await AudioRecorder.isRecording;
              setState(() {
                _isRecording = isRecording;
              });
              await AudioRecorder.start(
                  path: path, audioOutputFormat: AudioOutputFormat.AAC);
            } else {
              await AudioRecorder.start(
                  path: getPath(), audioOutputFormat: AudioOutputFormat.AAC);
            }
            bool isRecording = await AudioRecorder.isRecording;

            setState(() {
              _recording = new Recording(
                  duration: new Duration(minutes: 1),
                  path: getPath(),
                  audioOutputFormat: AudioOutputFormat.AAC);
              _isRecording = isRecording;
            });
          } else {
            toast(AppLocalizations.of(context).translate('PERMISION'));
          }
        } catch (e) {
          print(e);
        }
      }
    } else {
      //request permission
      if (!_storagePermissionGranted && _startedRecord == 2) {
        PermissionHandler().requestPermissions(
            [PermissionGroup.storage, PermissionGroup.microphone]);
      }
      if (!_recordPermissionGranted && _startedRecord == 2) {
        PermissionHandler().requestPermissions(
            [PermissionGroup.storage, PermissionGroup.microphone]);
      }
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    setState(() {
      _fileName = recording.path.split('/')[4];
      String a = recording.path;
      var el = a.split('/').removeLast();
      _storagePath = a.replaceAll('/' + el, '');
    });
    bool isRecording = await AudioRecorder.isRecording;
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }

  void _startUploading() async {
    final uploader = FlutterUploader();
    final auth = Provider.of<AuthBlock>(context);
//    final auth = Auth();
    final taskId = await uploader.enqueue(
        url: "your upload link", //required: url to upload to
        files: [
          FileItem(
              filename: _fileName, savedDir: _storagePath, fieldname: "file")
        ], // required: list of files that you want to upload
        method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)
        headers: {"Bearer": auth.user['token']},
//        data: {"name": "john"},
        showNotification:
            false, // send local notification (android only) for upload status
        tag: "upload 1"); // unique tag for upload task
  }

  FutureOr _checkStoragePermission(PermissionStatus status) {
    if (status == PermissionStatus.granted) {
      setState(() {
        _storagePermissionGranted = true;
      });
      return status;
    }
  }

  FutureOr _checkRecordPermission(PermissionStatus status) {
    if (status == PermissionStatus.granted) {
      setState(() {
        _recordPermissionGranted = true;
      });
      return status;
    }
  }

  getPath() async {
    return "";
  }
}
