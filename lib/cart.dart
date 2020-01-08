import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/shop/orange_token.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blocks/auth_block.dart';
import 'database/moor_database.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  var totalSum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<CartDao>(context);
    return StreamBuilder(
      stream: dao.getAllCarts(),
      builder: (context, AsyncSnapshot<List<CartData>> snapshot) {
        List<CartData> carts = snapshot.data ?? List();
        if (carts.length > 0) {
          carts.forEach((data) => {totalSum += int.parse(data.price)});
        }
        return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate('CART')),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Container(
                      child: Text(
                          carts.length.toString() +
                              " " +
                              AppLocalizations.of(context).translate('CART'),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        final item = carts;
                        return Dismissible(
                          // Each Dismissible must contain a Key. Keys allow Flutter to
                          // uniquely identify widgets.
                          key: Key(UniqueKey().toString()),
                          // Provide a function that tells the app
                          // what to do after an item has been swiped away.
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              // Then show a snackbar.
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text(item[index].name + " dismissed"),
                                  duration: Duration(seconds: 1)));
                            } else {
                              // Then show a snackbar.
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      item[index].name + " added to carts"),
                                  duration: Duration(seconds: 1)));
                            }
                            // Remove the item from the data source.
                            setState(() {
                              carts.removeAt(index);
                            });
                          },
                          // Show a red background as the item is swiped away.
                          background: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Divider(
                                  height: 0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: ListTile(
                                    trailing: Text('\N ${carts[index].price}'),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: Colors.blue),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: item[index].imageUrl,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      carts[index].name ?? "null",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, bottom: 1),
                                              child: Text('in stock',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "TOTAL",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                            Text("\N " + totalSum.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("Subtotal ",
                                    style: TextStyle(fontSize: 14))),
                            Text("\N" + totalSum.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("Shipping",
                                    style: TextStyle(fontSize: 14))),
                            Text("\N0.00",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("Tax",
                                    style: TextStyle(fontSize: 14))),
                            Text("\N0.00",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 50, bottom: 10),
                  child: ButtonTheme(
                    buttonColor: Theme.of(context).primaryColor,
                    minWidth: double.infinity,
                    height: 40.0,
                    child: Consumer<AuthBlock>(builder:
                        (BuildContext context, AuthBlock auth, Widget child) {
                      return RaisedButton(
                        onPressed: () {
                          //TODO: check for user auth
//                          auth.user

                          return;

                          //TODO: foreach carts and submit to addToCart to web
                          //TODO: add pusher to listen on payment completion then submit another request to complete payment on the server so it can be saved on the dashboard
                          //TODO: implement local checkout to open Orange webView to complete payment.
                          //TODO: get the token then on getting the token do other stuff so we avoid token being expired
                          http.post("https://api.orange.com/oauth/v2/token",
                              body: {
                                "grant_type": "client_credentials"
                              },
                              headers: {
                                HttpHeaders.authorizationHeader:
                                    "Basic U0hWdmN5UW12U2sxanhydlBBWm1STWFhUTQ5eENQMTg6TmpkU09OT0dxb2xhYXdFNw==",
                                HttpHeaders.contentTypeHeader:
                                    "application/x-www-form-urlencoded",
                              }).then((dynamic response) {
                            final int statusCode = response.statusCode;
                            if (statusCode < 200 ||
                                statusCode > 400 ||
                                json == null) {
                              return;
                            } else {
                              OrangeToken orangeToken =
                                  orangeTokenFromJson(response.body);

                              //now finalize creating a payment session
                              http.post(
                                  'https://api.orange.com/orange-money-webpay/dev/v1/webpayment',
                                  body: {
                                    'email': "",
                                    'password': ""
                                  },
                                  headers: {
                                    HttpHeaders.acceptHeader:
                                        'application/json',
                                    HttpHeaders.contentTypeHeader:
                                        'application/json'
                                  }).then((dynamic response) {
                                final int statusCode = response.statusCode;
                                if (statusCode < 200 ||
                                    statusCode > 400 ||
                                    json == null) {
                                  return;
                                } else {}
                              });
                            }
                          }).catchError((dynamic onError) {});
                          _launchURL();
                        },
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ));
      },
    );
  }

  void _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
