import 'dart:developer';

import 'package:api_2/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService with ChangeNotifier {
  List<Product> products = [];
  Future<void> getData() async {
    try {
      final response = await Dio().get('https://fakestoreapi.com/products');

      List<dynamic> jsonData = response.data;

      // Convert JSON to List<Product>
      products = jsonData.map((e) => Product.fromJson(e)).toList();

      notifyListeners();
    } catch (e) {
      log('Error fetching products', error: e);
    }
  }

  List<Product> cartItems = [];

  double total = 0;

  int itemCount = 0;

  void addToCart(Product product) {
    cartItems.add(product);
    itemCount++;
    total = cartItems.fold(0, (a, b) => a + b.price);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    total = cartItems.fold(0, (a, b) => a + b.price);
    itemCount--;
    notifyListeners();
  }

  String controllerText = '';
  List<Product> filteredList = [];

  void search(String value) {
    controllerText = value;
    filteredList = products
        .where(
          (element) =>
              element.title.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
