import 'package:flutter/material.dart';

import 'BT1/Screens/OnboardingScreen.dart';
import 'BT2/Screens/ExploreScreen.dart';

void main() {
  runApp(const ShopApp() /*GroceryApp()*/);
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial', useMaterial3: true),
      home: const OnboardingScreen(),
    );
  }
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial', useMaterial3: true),
      home: const ExploreScreen(),
    );
  }
}
