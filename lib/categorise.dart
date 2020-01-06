import 'package:flutter/material.dart';

class Categorise extends StatefulWidget {
  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  final List<String> imgList = [
    'assets/images/slide-img1.jpg'
        'assets/images/slide-img2.jpg'
        'assets/images/slide-img2x.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorise'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 8),
              children: List.generate(6, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(imgList[index]),
                          ),
                          ListTile(
                              title: Text(
                            'Two Gold Rings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
