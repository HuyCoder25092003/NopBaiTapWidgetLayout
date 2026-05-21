import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String stock;
  final String price;

  const ProductItem({
    super.key,
    required this.name,
    required this.stock,
    required this.price,
  });

  static const greenColor = Color(0xff57933C);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          const SizedBox(width: 22),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  stock,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.favorite_border, size: 30, color: Colors.black54),
        ],
      ),
    );
  }
}
