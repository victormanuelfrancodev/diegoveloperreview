import 'package:cached_network_image/cached_network_image.dart';
import 'package:diegoveloperreview/models/result_product.dart';
import 'package:diegoveloperreview/widgets/cell_list_products.dart';
import 'package:diegoveloperreview/widgets/user.dart';
import 'package:flutter/material.dart';

import '../apimanager/api_manager.dart';
import '../models/category.dart';
import '../util/utils.dart';

class ListProducts extends StatefulWidget {
  ListProducts({Key? key}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> with TickerProviderStateMixin {
  final ValueNotifier<List<Resultproduct>> productListNotifier = ValueNotifier<List<Resultproduct>>([]);
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  Future<void> _refreshProducts() async {
    List<Resultproduct> products = await getAllProductList();
    productListNotifier.value = products;

    // Asegúrate de inicializar el TabController después de obtener los productos.
    _tabController = TabController(vsync: this, length: getUniqueCategories(products).length);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Resultproduct>>(
      valueListenable: productListNotifier,
      builder: (context, products, child) {
        List<Category> categories = getUniqueCategories(products);

        if (products.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Primer Code Review DiegoVeloper"),
            ),
            body: Column(
              children: [
                User(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: categories.map((category) {
                      return RefreshIndicator(
                        onRefresh: _refreshProducts,
                        child: ListView.builder(
                          itemCount: products.where((product) => product.category.id == category.id).length,
                          itemBuilder: (context, index) {
                            Resultproduct product = products.where((p) => p.category.id == category.id).toList()[index];
                            return CellListProducts(product: product);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 70,
                  child: TabBar(
                    controller: _tabController,
                    tabs: categories.map((category) => Tab(text: category.name.toString().split('.').last)).toList(),
                    isScrollable: true,
                  ),
                )
              ],
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
    _tabController?.dispose();
    productListNotifier.dispose();
    super.dispose();
  }
}