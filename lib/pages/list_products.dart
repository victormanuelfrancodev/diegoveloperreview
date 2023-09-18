import 'package:cached_network_image/cached_network_image.dart';
import 'package:diegoveloperreview/models/result_product.dart';
import 'package:diegoveloperreview/widgets/cell_list_products.dart';
import 'package:flutter/material.dart';

import '../apimanager/api_manager.dart';

class ListProducts extends StatefulWidget {
  ListProducts({Key? key}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  final ValueNotifier<List<Resultproduct>> productListNotifier = ValueNotifier<List<Resultproduct>>([]);

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  Future<void> _refreshProducts() async {
    List<Resultproduct> products = await getAllProductList();
    productListNotifier.value = products;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Resultproduct>>(
      valueListenable: productListNotifier,
      builder: (context, products, child) {
        if (products.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: _refreshProducts,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CellListProducts(product: products[index]);
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    productListNotifier.dispose();
    super.dispose();
  }
}