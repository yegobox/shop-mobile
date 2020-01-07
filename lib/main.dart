import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_scaffold/auth/auth.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/cart.dart';
import 'package:flutter_scaffold/categorise.dart';
import 'package:flutter_scaffold/home/home.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/product_detail.dart';
import 'package:flutter_scaffold/settings.dart';
import 'package:flutter_scaffold/shop/shop.dart';
import 'package:flutter_scaffold/wishlist.dart';
import 'package:provider/provider.dart';

import 'database/moor_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale locale = Locale('fr');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock()),
      Provider(builder: (_) => Database()),
      Provider(builder: (_) => Database().cartDao)
    ],
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('fr'), Locale('en'), Locale('ar')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange[500],
          accentColor: Colors.lightBlue[900],
          fontFamily: locale.languageCode == 'ar' ? 'Dubai' : 'Lato'),
      routes: {
        '/': (context) => Home(),
        'auth': (context) => Auth(),
        'shop': (context) => Shop(),
        'categorise': (context) => Categorise(),
        'wishlist': (context) => WishList(),
        'cart': (context) => CartList(),
        'profile': (context) => Profile(),
        'products': (context) => Products()
      },
    ),
  ));
}
