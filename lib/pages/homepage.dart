import 'package:api_2/pages/widgets/product_tile.dart';
import 'package:api_2/services/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffF0E4D3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Products", style: GoogleFonts.bebasNeue(fontSize: 36)),
      ),
      body: FutureBuilder(
        future: Provider.of<ApiService>(context, listen: false).getData(),
        builder: (context, snapshot) => Consumer<ApiService>(
          builder: (context, value, child) {
            if (value.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      context.read<ApiService>().search(searchController.text);
                    },
                    decoration: InputDecoration(
                      hintText: "Search Item",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: ProductTile(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
