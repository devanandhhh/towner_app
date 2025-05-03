import 'dart:convert';
import 'dart:developer';

import 'package:my_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ProductModel>> getData() async {
    const String baseurl = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(baseurl));
    log(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<dynamic> productList = data["products"];
      // print(productList.toString());
      return productList.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      log("No data available");
      return [];
    }
  }
}
