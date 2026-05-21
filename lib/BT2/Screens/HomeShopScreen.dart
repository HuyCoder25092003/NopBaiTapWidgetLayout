import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';
import '../Models/CategoryItem.dart';
import '../Models/ProductItem.dart';
import '../Widgets/BestSellerCard.dart';
import '../Widgets/CategoryIcon.dart';

class HomeShopScreen extends StatelessWidget {
  const HomeShopScreen({super.key});

  static const List<CategoryItem> categories = [
    CategoryItem(title: 'Music', icon: Icons.music_note),
    CategoryItem(title: 'Property', icon: Icons.apartment),
    CategoryItem(title: 'Game', icon: Icons.sports_esports),
    CategoryItem(title: 'Gadget', icon: Icons.phone_android),
    CategoryItem(title: 'Electronic', icon: Icons.desktop_windows),
    CategoryItem(title: 'Property', icon: Icons.cut),
    CategoryItem(title: 'Game', icon: Icons.local_shipping),
    CategoryItem(title: 'Book', icon: Icons.menu_book),
  ];

  static const List<ProductItem> bestSellerProducts = [
    ProductItem(title: 'Plant'),
    ProductItem(title: 'Lamp'),
    ProductItem(title: 'Chair'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 38, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),

              const SizedBox(height: 22),

              buildSearchBar(),

              const SizedBox(height: 20),

              buildBanner(),

              const SizedBox(height: 12),

              const DotIndicator(),

              const SizedBox(height: 20),

              buildCategoryGrid(),

              const SizedBox(height: 10),

              buildBestSellerTitle(),

              const SizedBox(height: 15),

              buildBestSellerList(),
            ],
          ),
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
                'Welcome back,',
                style: TextStyle(color: AppColors.textGrey, fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                'Samantha William',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),

        Stack(
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.black87,
            ),
            Positioned(
              right: -1,
              top: -2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.black26, size: 22),
                SizedBox(width: 8),
                Text(
                  'Searching Item',
                  style: TextStyle(color: Colors.black26, fontSize: 15),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 24),
        ),
      ],
    );
  }

  Widget buildBanner() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, color: Colors.white, size: 64),
          SizedBox(height: 6),
          Text(
            'Image Here',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 14,
      crossAxisSpacing: 12,
      childAspectRatio: 0.95,
      children: categories.map((category) {
        return CategoryIcon(title: category.title, icon: category.icon);
      }).toList(),
    );
  }

  Widget buildBestSellerTitle() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Best Seller',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.orange,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget buildBestSellerList() {
    return Row(
      children: bestSellerProducts.map((product) {
        final bool isLast = product == bestSellerProducts.last;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 14),
            child: BestSellerCard(title: product.title),
          ),
        );
      }).toList(),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(isActive: true),
        Dot(isActive: false),
        Dot(isActive: false),
        Dot(isActive: false),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;

  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 8 : 6,
      height: isActive ? 8 : 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.orange : Colors.black12,
        shape: BoxShape.circle,
      ),
    );
  }
}
