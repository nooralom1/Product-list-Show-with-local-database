import 'dart:convert';
import 'dart:developer';

import 'package:product_show/database/product_list.dart';
import 'package:product_show/model/product_list_model.dart';

class ProductListService {
  static Future<List<Products>> productListService() async {
    try {
      ProductListModel data = await ProductListModel.fromJson(
          jsonDecode(jsonEncode(ProductList.productList)));
      return data.products ?? [];
    } catch (e) {
      log("Error: ${e}");
    }
    return [];
  }
}
