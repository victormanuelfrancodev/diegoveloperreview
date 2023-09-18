import 'package:cached_network_image/cached_network_image.dart';
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
          CachedNetworkImage(
            imageUrl: product.images[0],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(product.title),
          SizedBox(height: 8.0),
          Text(product.description),
        ],
      ),
    );
  }
}