import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';
import '../Models/ProductItem.dart';
import '../Widgets/ProductLargeCard.dart';
import 'HomeShopScreen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const List<ProductItem> products = [
    ProductItem(title: 'Lamp'),
    ProductItem(title: 'Car'),
    ProductItem(title: 'Plant'),
  ];

  void goToHomeShop(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeShopScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 70, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),

            const SizedBox(height: 50),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(height: 30),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () => goToHomeShop(context),
                    child: ProductLargeCard(title: product.title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Find products easier here',
                style: TextStyle(color: Colors.white70, fontSize: 22),
              ),
            ],
          ),
        ),

        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
