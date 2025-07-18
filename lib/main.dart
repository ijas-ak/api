import 'package:api_2/controllers/provider.dart';
import 'package:api_2/pages/intro_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(home: IntroPage(), debugShowCheckedModeBanner: false),
    );
  }
}
