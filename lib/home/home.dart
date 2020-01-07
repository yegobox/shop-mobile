import 'dart:io';
import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/database/moor_database.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/services/products.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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

  int cartCount = 0;
  loadHeaderImages() async {
    final response = await http.get('$BASE_URL/api/products',
        headers: {HttpHeaders.acceptHeader: 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        products = productsFromJson(response.body);
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Error loading products',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    this.loadHeaderImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          this.recordAudio();
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.green,
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
                    child: Badge(
                      position: BadgePosition.topLeft(),
                      badgeContent: Text(
                        cartCount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.shopping_cart),
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
//                                              Navigator.pushNamed(
//                                                context,
//                                                'products',
//                                                arguments:
//                                                    ScreenArgumentsProducts(
//                                                        i.name,
//                                                        i.id,
//                                                        i.images[0]
//                                                            .largeImageUrl,
//                                                        i.description,
//                                                        i.price.toString(),
//                                                        i.specialPrice
//                                                            .toString(),
//                                                        i.reviews.totalRating
//                                                            .toString()),
//                                              );
                                              final database =
                                                  Provider.of<Database>(
                                                      context);
                                              final cart = CartData(
                                                  id: i.id,
                                                  refId: i.id,
                                                  price: i.price.toString(),
                                                  name: i.name,
                                                  imageUrl:
                                                      i.images[0].largeImageUrl,
                                                  quantity: 1);
                                              setState(() {
                                                cartCount += 1;
                                              });
                                              database.cartDao
                                                  .isRowExist(i.id)
                                                  .listen((data) => {
                                                        if (data.length == 0)
                                                          {
                                                            cartCount =
                                                                cart.quantity,
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
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
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
                        child: products == null
                            ? Container()
                            : GridView.count(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                padding: EdgeInsets.only(
                                    top: 8, left: 6, right: 6, bottom: 12),
                                children: List.generate(products.data.length,
                                    (index) {
                                  return Container(
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: InkWell(
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) -
                                                  70,
                                              width: double.infinity,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    products.data.length != 0
                                                        ? products
                                                            .data[index]
                                                            .images[0]
                                                            .largeImageUrl
                                                        : "",
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                            ListTile(
                                                title: Text(
                                              'Two Gold Rings',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
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
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void recordAudio() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
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
}
