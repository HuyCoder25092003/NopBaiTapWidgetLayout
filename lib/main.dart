import 'package:flutter/material.dart';

import './ShoeStoreShop/ShopStore.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial', useMaterial3: true),
      home: const ShopStore(),
    );
  }
}
