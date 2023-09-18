import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/result_product.dart';

class CellListProducts extends StatelessWidget {
  CellListProducts({required this.product,super.key});
  Resultproduct product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(product.description),
      leading: CachedNetworkImage(
        imageUrl: product.images[0],
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
