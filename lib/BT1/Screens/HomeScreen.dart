import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';
import '../Models/CategoryModel.dart';
import '../Widgets/CategoryCard.dart';
import '../Widgets/PromoCard.dart';
import './ProductListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<CategoryModel> categories = [
    CategoryModel(title: 'Fruit', emoji: '🍊'),
    CategoryModel(title: 'Vegetable', emoji: '🥬'),
    CategoryModel(title: 'Cookies', emoji: '🍩'),
    CategoryModel(title: 'Meat', emoji: '🥩'),
  ];

  void goToProductList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProductListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBalanceHeader(),

              const SizedBox(height: 32),

              const PromoCard(),

              const SizedBox(height: 32),

              const Text(
                'For you',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.98,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () => goToProductList(context),
                      child: CategoryCard(
                        title: category.title,
                        emoji: category.emoji,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBalanceHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Balance',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '\$1,700.00',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 50,
          height: 100,
          decoration: const BoxDecoration(
            color: AppColors.green,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
