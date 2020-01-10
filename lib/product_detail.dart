//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_scaffold/home/screen_argument_product_details.dart';
//import 'package:flutter_scaffold/localizations.dart';
//import 'package:html/parser.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
//
//class Products extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final ScreenArgumentsProducts args =
//        ModalRoute.of(context).settings.arguments;
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(AppLocalizations.of(context).translate('PRODUCT_DETAILS')),
//      ),
//      body: SafeArea(
//        top: false,
//        left: false,
//        right: false,
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              SizedBox(
//                width: double.infinity,
//                height: 260,
//                child: Hero(
//                    tag: "tag-01",
//                    child: CachedNetworkImage(
//                      fit: BoxFit.cover,
//                      imageUrl: args.imageUrl,
//                      placeholder: (context, url) =>
//                          Center(child: CircularProgressIndicator()),
//                      errorWidget: (context, url, error) =>
//                          new Icon(Icons.error),
//                    )),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(left: 15, right: 15),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      alignment: Alignment(-1.0, -1.0),
//                      child: Padding(
//                        padding: const EdgeInsets.only(top: 15, bottom: 15),
//                        child: Text(
//                          args.name,
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 24,
//                              fontWeight: FontWeight.w600),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 25),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.only(right: 10.0),
//                                child: Text(
//                                  '\N' + args.price,
//                                  style: TextStyle(
//                                    color: Theme.of(context).primaryColor,
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w600,
//                                  ),
//                                ),
//                              ),
//                              Text('\N' + args.specialPrice,
//                                  style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 16,
//                                      decoration: TextDecoration.lineThrough)),
//                            ],
//                          ),
//                          Row(
//                            children: <Widget>[
//                              SmoothStarRating(
//                                  allowHalfRating: false,
//                                  onRatingChanged: (v) {},
//                                  starCount: 5,
//                                  rating: double.parse(args.totalRating),
//                                  size: 20.0,
//                                  color: Colors.amber,
//                                  borderColor: Colors.amber,
//                                  spacing: -0.8),
//                              Padding(
//                                padding: const EdgeInsets.only(left: 10.0),
//                                child: Text(args.totalRating,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 16,
//                                    )),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                    Column(
//                      children: <Widget>[
//                        Container(
//                            alignment: Alignment(-1.0, -1.0),
//                            child: Padding(
//                              padding: const EdgeInsets.only(bottom: 10.0),
//                              child: Text(
//                                'Description',
//                                style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w600),
//                              ),
//                            )),
//                        Container(
//                            alignment: Alignment(-1.0, -1.0),
//                            child: Padding(
//                              padding: const EdgeInsets.only(bottom: 10.0),
//                              child: Text(
//                                this._parseHtmlString(args.desc),
//                                style: TextStyle(
//                                    color: Colors.black, fontSize: 16),
//                              ),
//                            )),
//                        Container(
//                            child: Padding(
//                          padding: const EdgeInsets.only(top: 25.0),
//                          child: SizedBox(
//                            width: double.infinity,
//                            height: 50,
//                            child: RaisedButton(
//                              color: Colors.deepOrange[500],
//                              textColor: Colors.white,
//                              child: Text(AppLocalizations.of(context)
//                                  .translate('BUY')),
//                            ),
//                          ),
//                        ))
//                      ],
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  String _parseHtmlString(String htmlString) {
//    var document = parse(htmlString);
//
//    String parsedString = parse(document.body.text).documentElement.text;
//
//    return parsedString;
//  }
//}
