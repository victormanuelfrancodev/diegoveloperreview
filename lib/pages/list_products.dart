import 'package:diegoveloperreview/models/result_product.dart';
import 'package:flutter/material.dart';

import '../apimanager/api_manager.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Resultproduct>>(
      future: getAllProductList(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasData) {
            List<Resultproduct> result = snapshot.data!;
            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                Resultproduct product = result[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  leading: Image.network(product.images[0]),
                );
              },
            );
          } else {
            return Center(
              child: Text('No data'),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
