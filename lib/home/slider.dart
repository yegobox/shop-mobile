import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  //todo: put this images for now
  final List<String> imgList = [
    'assets/images/slide-img1.jpg',
    'assets/images/slide-img2.jpg',
    'assets/images/slide-img2x.jpg',
    'assets/images/slide-img3.jpg',
    'assets/images/slide-img3v.jpg',
    'assets/images/slide-img11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              height: 350.0,
              viewportFraction: 1.0,
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(i
//                          fit: BoxFit.cover,
//                          imageUrl: i,
//                          placeholder: (context, url) =>
//                              Center(child: CircularProgressIndicator()),
//                          errorWidget: (context, url, error) =>
//                              new Icon(Icons.error),
                            ));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
