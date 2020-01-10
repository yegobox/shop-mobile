import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/database/moor_database.dart';
import 'package:flutter_scaffold/home/categories_response.dart';
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
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  List<String> imgList = List<String>();
  TextEditingController _controller = new TextEditingController();
  Products products;
  Categories categories;

  int cartCount = 0;

  bool _storagePermissionGranted = false;

  bool _recordPermissionGranted = false;

  String _fileName;

  String _storagePath;
  loadHeaderImages() async {
    try {
      final category = await http.get('$BASE_URL/api/categories',
          headers: {HttpHeaders.acceptHeader: 'application/json'});

      if (category.statusCode == 200) {
        setState(() {
          categories = categoriesFromJson(category.body);
        });
      }

      final productResponse = await http.get('$BASE_URL/api/products',
          headers: {HttpHeaders.acceptHeader: 'application/json'});
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      floatingActionButton: HoldDetector(
        onHold: _recordAudio,
        onCancel: () {
          _stop();
          setState(() {
            _startedRecord = 0;
            toast("Sending your command...");
          });
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
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            AppLocalizations.of(context)
                                .translate('NEW_ARRIVALS'),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
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
                                                  imageUrl:
                                                      i.images[0].largeImageUrl,
                                                  quantity: 1);
                                              setState(() {
                                                //
                                                database.cartCountDao
                                                    .insertCount(CartCountData(
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
                                                          new Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    i.name,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  subtitle: Text(
                                                      "N " + i.price.toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          fontWeight:
                                                              FontWeight.w700)),
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
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-1.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('Shop By Category',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                      Container(
                        child: categories == null
                            ? Container(
                                child: Text("No categories"),
                              )
                            : SizedBox(
                                child: GridView.count(
                                  childAspectRatio: 8,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 1,
                                  children: List.generate(
                                      categories.data.length, (i) {
                                    return categories.data[i].name == "Root"
                                        ? Container()
                                        : Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  'specific',
                                                  arguments:
                                                      ScreenArgumentsProducts(
                                                          categories
                                                              .data[i].id),
                                                );
                                              },
                                              child: Card(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 12.0,
                                                    left: 8.0,
                                                    right: 8.0,
                                                    bottom: 10),
                                                child: Text(categories
                                                    .data[index].name),
                                              )),
                                            ),
                                          );
                                  }),
                                ),
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
        print("tracking....:" + _startedRecord.toString());
        try {
          if (await AudioRecorder.hasPermissions) {
            await AudioRecorder.start(audioOutputFormat: AudioOutputFormat.AAC);

            bool isRecording = await AudioRecorder.isRecording;
            setState(() {
              _recording = new Recording(duration: new Duration(), path: "");
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
    print(_isRecording);
    if (_isRecording) {
      var recording = await AudioRecorder.stop();
      bool isRecording = await AudioRecorder.isRecording;
      setState(() {
        _startedRecord = 0;
        _isRecording = isRecording;
        _recording = recording;
        _fileName = recording.path.split('/')[4];
        String a = recording.path;
        var el = a.split('/').removeLast();
        _storagePath = a.replaceAll('/' + el, '');
        _startUploading(_storagePath, _fileName);
      });
      _controller.text = recording.path;
    } else {
      toast("failed to upload try again");
    }
  }

  void _startUploading(String storagePath, String fileName) async {
    final uploader = FlutterUploader();
    final auth = Provider.of<AuthBlock>(context);

    final taskId = await uploader.enqueue(
        url: "https://shop.yegobox.com/api/audios", //required: url to upload to
        files: [
          FileItem(
              filename: fileName, savedDir: storagePath, fieldname: "audio")
        ], // required: list of files that you want to upload
        method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)
        headers: {"Bearer": auth.user['token']},
        data: {"token": auth.user['token']},
        showNotification:
            true, // send local notification (android only) for upload status
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
//    io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
//    return appDocDirectory.path + '/' + "maafe";
  }
}
