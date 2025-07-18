import 'package:api_2/model/model.dart';
import 'package:api_2/services/service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  void getDataFromApi() async {
    List<Product> data = await ApiService().getData();
    products = data;
    notifyListeners();
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
