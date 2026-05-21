import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Buy Orange 10 Kg\nGet discount 25%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w800,
              height: 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
