import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';

class ProductLargeCard extends StatelessWidget {
  final String title;

  const ProductLargeCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.blue,
              child: const ImagePlaceholder(iconSize: 62, textSize: 20),
            ),
          ),

          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.centerLeft,
            color: AppColors.lightGrey,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final double iconSize;
  final double textSize;

  const ImagePlaceholder({
    super.key,
    required this.iconSize,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image_outlined, color: Colors.white, size: iconSize),
        const SizedBox(height: 6),
        Text(
          'Image Here',
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
