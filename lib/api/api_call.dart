import 'dart:async';
import 'dart:convert';

import 'package:blinkit_clone/models/product_details.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<List<ProductDetails>?> getStoreData({String? dataLink}) async {
    final res = await http.get(Uri.parse(dataLink!));
    if (res.statusCode == 200) {
      final List<dynamic> dataList = jsonDecode(res.body);
      return dataList
          .map((json) => ProductDetails.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return null;
  }
}
