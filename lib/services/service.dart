import 'dart:developer';
import 'package:api_2/constants/url_const.dart';
import 'package:api_2/model/model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future getData() async {
    try {
      final response = await Dio().get(
        '${UrlConst.baseUrl}${UrlConst.productUrl}',
      );
      List<dynamic> jsonData = response.data;

      // Convert JSON to List<Product>
      return jsonData.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        log('Bad Response ${e.response?.statusCode}');
      }
    }
  }
}
