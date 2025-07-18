import 'package:api_2/model/model.dart';
import 'package:api_2/services/service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  String controllerText = '';
  List<Product> filteredList = [];
  List<Product> products = [];
  List<Product> cartItems = [];
  double total = 0;
  int itemCount = 0;

  //Methods

  //calling data from api method
  void getDataFromApi() async {
    List<Product> data = await ApiService().getData();
    products = data;
    notifyListeners();
  }

  //add to cart method
  void addToCart(Product product) {
    cartItems.add(product);
    itemCount++;
    total = cartItems.fold(0, (a, b) => a + b.price);
    notifyListeners();
  }

  //remove from cart method
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    total = cartItems.fold(0, (a, b) => a + b.price);
    itemCount--;
    notifyListeners();
  }

  //search method
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
