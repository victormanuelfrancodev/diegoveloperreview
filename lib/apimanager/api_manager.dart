import 'dart:convert';
import 'dart:io';
import 'package:diegoveloperreview/models/result_product.dart';

Future<List<Resultproduct>> getAllProductList() async {
  ///Create uri escuelajs
  //https://api.escuelajs.co/api/v1/products
  final uri = Uri.https(
    'api.escuelajs.co',
    '/api/v1/products',
  );

  ///Create HTTP Request Object
  HttpClient httpClient = new HttpClient();

  ///Try catch
  try {
    ///Create HTTP Request
    HttpClientRequest request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == 200) {
      var body = await response.transform(utf8.decoder).join();
      List<Resultproduct> result = resultproductFromJson(body);
      return result;
    }
  } catch (e) {
    print(e);
  }
  return [];
}
