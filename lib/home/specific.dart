import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/database/moor_database.dart';
import 'package:flutter_scaffold/home/screen_argument_product_details.dart';
import 'package:flutter_scaffold/services/auth_service.dart';
import 'package:flutter_scaffold/services/products.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';

class Specific extends StatefulWidget {
  @override
  _SpecificState createState() => _SpecificState();
}

class _SpecificState extends State<Specific> {
  var totalSum = 0;
  AuthService _authService = AuthService();
  Products products;
  bool _isLoggedIn = false;
  bool _isProcessingPayment = false;

  var _token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<CartDao>(context);
    final ScreenArgumentsProducts args =
        ModalRoute.of(context).settings.arguments;
    _loadData(args.id);
    return StreamBuilder(
      stream: dao.getAllCarts(),
      builder: (context, AsyncSnapshot<List<CartData>> snapshot) {
        List<CartData> carts = snapshot.data ?? List();
        totalSum = 0;
        if (carts.length > 0) {
          carts.forEach((data) => {totalSum += int.parse(data.price)});
        }
        return Scaffold(
            appBar: AppBar(
              title: Text("Single category"),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child: products == null
                      ? Container(
                          child: Text("No categories"),
                        )
                      : SizedBox(
                          child: GridView.count(
                            childAspectRatio: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 1,
                            children: List.generate(products.data.length, (i) {
                              return Container(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    'specific',
                                    arguments: ScreenArgumentsProducts(
                                        products.data[i].id),
                                  );
                                },
                                child: Card(
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
                                            imageUrl: products.data.length != 0
                                                ? products.data[i].images[0]
                                                    .largeImageUrl
                                                : "",
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    new Icon(Icons.error),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            products.data[i].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        )
                                      ]),
                                ),
                              ));
                            }),
                          ),
                        ),
                )
              ],
            ));
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

  void _loadData(int categoryId) async {
    final category = await http.get(
        '$BASE_URL/api/products?category_id=' + categoryId.toString(),
        headers: {HttpHeaders.acceptHeader: 'application/json'});

    if (category.statusCode == 200) {
      setState(() {
        products = productsFromJson(category.body);
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
}
