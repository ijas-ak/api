import 'package:api_2/pages/widgets/addtocart_button.dart';
import 'package:api_2/services/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, value, child) => GridView.builder(
        itemCount: value.controllerText.isNotEmpty
            ? value.filteredList.length
            : value.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.50,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final product = value.controllerText.isEmpty
              ? value.products[index]
              : value.filteredList[index];
          return Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffFAF7F3),
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.network(product.image, height: 180),
                ),
                SizedBox(height: 40),
                Text(
                  product.title.substring(0, 18),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                AddtoCartButton(product: product),
              ],
            ),
          );
        },
      ),
    );
  }
}
