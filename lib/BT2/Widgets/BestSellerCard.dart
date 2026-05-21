import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';

class BestSellerCard extends StatelessWidget {
  final String title;

  const BestSellerCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Container(
            height: 100,
            width: double.infinity,
            color: AppColors.blue,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, color: Colors.white, size: 42),
                SizedBox(height: 3),
                Text(
                  'Image Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Product name
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 7, 8, 0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Rating
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  '★★★★★',
                  style: TextStyle(color: Color(0xffF5B942), fontSize: 12),
                ),
                SizedBox(width: 4),
                Text(
                  '5.0',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
