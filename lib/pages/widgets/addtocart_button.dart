import 'package:api_2/model/model.dart';
import 'package:api_2/pages/cart.dart';
import 'package:api_2/services/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddtoCartButton extends StatelessWidget {
  const AddtoCartButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ApiService>().addToCart(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: EdgeInsets.all(12),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Item Added to Cart"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart()),
                    );
                  },
                  child: Text(
                    "Go To Cart",
                    style: TextStyle(color: Colors.amber.shade700),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Text(
          '\$${product.price.roundToDouble()}',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
//  showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             contentPadding: EdgeInsets.all(14),
//             backgroundColor: Colors.green.shade800,
//             content: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: 30),
//                 CircleAvatar(
//                   backgroundColor: Colors.black,
//                   child: Icon(Icons.done, color: Colors.green),
//                 ),
//                 SizedBox(height: 30),
//                 Text(
//                   "Item added Successfully",
//                   style: GoogleFonts.lato(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 30),

//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: TextButton(
//                     style: ButtonStyle(
//                       foregroundColor: WidgetStatePropertyAll(Colors.white),
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                     child: Text("OK"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
