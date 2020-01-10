import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/services/auth_service.dart';
import 'package:flutter_scaffold/shop/orange_token.dart';
import 'package:flutter_scaffold/shop/order_response.dart';
import 'package:flutter_scaffold/shop/web_payment_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
  AuthService _authService = AuthService();

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
                          //TODO: swipe to delete should delete an item
                          //TODO: option to increase quantity on swipe right.
                          decideAuthIsNeeded(carts, auth);
                        },
                        child: _isProcessingPayment
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  decideAuthIsNeeded(List<CartData> carts, AuthBlock auth) async {
    var _user = auth.user == null ? null : auth.user['token'];
    if (_user != null) {
      setState(() {
        _isLoggedIn = true;
      });
      setState(() {
        _token = _user;
        _isProcessingPayment = true;
      });

      final db = Provider.of<Database>(context);
      db.resetDb();
//      submitCart(carts, auth);
    } else {
      toast(AppLocalizations.of(context).translate('YOUMUSTBELOGGEDIN'));
      Navigator.pop(context);
      Navigator.pushNamed(context, 'auth');
      setState(() {
        _isLoggedIn = false;
      });
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

  submitCart(List<CartData> carts, AuthBlock auth) async {
    //NOTE:use this optimal solution to post many files or data on server

    try {
      List<Response> list = await Future.wait(carts.map((cart) => http.post(
              "https://shop.yegobox.com/api/checkout/cart/add/${cart.refId.toString()}",
              body: {
                'product_id': cart.refId.toString(),
                'quantity': cart.quantity.toString(),
                'token': auth.user['token']
              },
              headers: {
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader:
                    'application/x-www-form-urlencoded'
              })));

      return list.map((response) {
        saveShipping(auth);
      }).toList();
    } catch (e) {
      setState(() {
        _isProcessingPayment = false;
      });
      print("got error but it is fine");
      print(e);
    }
  }

  void saveShipping(AuthBlock auth) async {
    var shipping = await http.post(
        'https://shop.yegobox.com/api/checkout/save-shipping',
        body: json.encode({
          "token": auth.user['token'],
          "shipping_method": "flatrate_flatrate"
        }),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
    final int statusCode = shipping.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      setState(() {
        _isProcessingPayment = false;
      });
      return;
    } else {
      //on save shipping then save-payment
      var payment =
          await http.post('https://shop.yegobox.com/api/checkout/save-payment',
              body: json.encode({
                "token": auth.user['token'],
                "shipping_method": "flatrate_flatrate",
                "payment": {"method": "cashondelivery"}
              }),
              headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json'
          });
      final int statusCode = payment.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        setState(() {
          _isProcessingPayment = false;
        });
        return;
      } else {
        //then save address
        var address = await http
            .post('https://shop.yegobox.com/api/checkout/save-address',
                body: json.encode({
                  "token": auth.user['token'],
                  "billing": {
                    "address1": {"0": "h23"},
                    "use_for_shipping": "true",
                    "first_name": auth.user['data']['name'],
                    "last_name": auth.user['data']['first_name'],
                    "email": auth.user['data']['email'],
                    "city": "none",
                    "state": "none",
                    "postcode": "none",
                    "country": "none",
                    "phone": auth.user['data']['phone'] ?? "45555"
                  },
                  "shipping": {
                    "address1": {"0": ""}
                  }
                }),
                headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json'
            });
        final int statusCode = address.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          setState(() {
            _isProcessingPayment = false;
          });
          return;
        } else {
          var order = await http.post(
              'https://shop.yegobox.com/api/checkout/save-order',
              body: json.encode({"token": auth.user['token']}),
              headers: {
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json'
              });
          final int statusCode = order.statusCode;

          if (statusCode < 200 || statusCode > 400 || json == null) {
            return;
          } else {
            OrderResponseFinal orderResponse =
                orderResponseFinalFromJson(order.body);

            http.post("https://api.orange.com/oauth/v2/token", body: {
              "grant_type": "client_credentials"
            }, headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  "Basic U0hWdmN5UW12U2sxanhydlBBWm1STWFhUTQ5eENQMTg6TmpkU09OT0dxb2xhYXdFNw==",
              HttpHeaders.contentTypeHeader:
                  "application/x-www-form-urlencoded",
            }).then((dynamic orange) {
              final int statusCode = orange.statusCode;
              if (statusCode < 200 || statusCode > 400 || json == null) {
                setState(() {
                  _isProcessingPayment = false;
                });
                return;
              } else {
                OrangeToken orangeTokenResponse =
                    orangeTokenFromJson(orange.body);

                //now finalize creating a payment session
                http.post(
                    'https://api.orange.com/orange-money-webpay/dev/v1/webpayment',
                    body: json.encode({
                      "merchant_key": "6b7cd337",
                      "currency": "OUV",
                      "order_id":
                          "MY_ORDER_ID_" + orderResponse.order.id.toString(),
                      "amount": double.parse(orderResponse.order.grandTotal),
                      "return_url": "http://myvirtualshop.webnode.es",
                      "cancel_url": "http://myvirtualshop.webnode.es/txncncld/",
                      "notif_url": "https://shop.yegobox.com/notify",
                      "lang": "en",
                      "reference": "ref Merchant"
                    }),
                    headers: {
                      HttpHeaders.acceptHeader: 'application/json',
                      HttpHeaders.authorizationHeader:
                          'Bearer ' + orangeTokenResponse.accessToken,
                      HttpHeaders.contentTypeHeader: 'application/json'
                    }).then((dynamic code) {
                  final int statusCode = code.statusCode;

                  if (statusCode < 200 || statusCode > 400 || json == null) {
                    setState(() {
                      _isProcessingPayment = false;
                    });
                    return;
                  } else {
                    setState(() {
                      _isProcessingPayment = false;
                    });
                    //empty tables cart & cartCount
                    final db = Provider.of<Database>(context);
                    db.cartDao.getAllCarts().listen((cart) {
                      db.cartDao.truncateCart(cart);
                    });
                    db.cartCountDao.getAllCartCounts().listen((count) {
                      db.cartCountDao.truncateCartCount(count);
                    });
                    //done emptying table
                    WePaymentSession wePaymentSession =
                        wePaymentSessionFromJson(code.body);
                    _launchURL(wePaymentSession.paymentUrl);
                  }
                });
              }
            }).catchError((dynamic onError) {
              setState(() {
                _isProcessingPayment = false;
              });
              print(onError);
            });
          }
        }
      }
    }
  }
}
