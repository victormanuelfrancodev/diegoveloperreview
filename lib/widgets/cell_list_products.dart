import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/result_product.dart';
import '../pages/detail_product.dart';

class CellListProducts extends StatelessWidget {
  CellListProducts({required this.product, super.key});
  Resultproduct product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailProduct(product: product)));
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          title: Text(
            product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          leading: Hero(
            tag: "Hero-${product.id}",
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2.0),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: product.images[0],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
