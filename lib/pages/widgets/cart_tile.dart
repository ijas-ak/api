import 'package:api_2/controllers/provider.dart';
import 'package:api_2/pages/bottom_nav.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) => Expanded(
        child: value.cartItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your cart is empty!",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40,
                        width: 140,
                        child: Center(
                          child: Text(
                            'Shop now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  final cart = value.cartItems[index];
                  return Card(
                    color: Colors.black,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      title: Text(
                        cart.title.substring(0, 18),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      leading: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Image.network(cart.image, width: 60),
                        ),
                      ),
                      subtitle: Text(
                        '\$${cart.price}',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ProductProvider>().removeFromCart(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red, size: 28),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
//Total items and Total Price

class TotalItems extends StatelessWidget {
  const TotalItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ProductProvider>(
                  builder: (context, value, child) => Row(
                    children: [
                      Text(
                        "TOTAL -",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        value.total.toStringAsFixed(2),
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        (value.total * 0.9).toStringAsFixed(2),
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FloatingActionButton.extended(
          backgroundColor: Colors.amber,
          onPressed: () {},
          icon: Icon(Icons.trolley),
          label: Consumer<ProductProvider>(
            builder: (context, value, child) => Text("${value.itemCount}"),
          ),
        ),
      ],
    );
  }
}
