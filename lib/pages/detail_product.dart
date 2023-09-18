import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diegoveloperreview/models/result_product.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final Resultproduct product;

  DetailProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: <Widget>[
          Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,),),
          SizedBox(height: 8.0),
          Text(product.description),
          CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: product.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) => Center(child: Container( width: 50, height:50, child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}