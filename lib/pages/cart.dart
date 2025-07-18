import 'package:api_2/pages/widgets/cart_tile.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0E4D3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Align(
          alignment: Alignment(1, 1),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  '10%\nDiscount',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "My Cart",
          style: GoogleFonts.bebasNeue(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [CartTile(), TotalItems()]),
      ),
    );
  }
}
