import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';
import '../Models/ProductModel.dart';
import '../Widgets/ProductItem.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  static const List<ProductModel> products = [
    ProductModel(name: 'Orange', stock: '1000 ready stock', price: '\$15'),
    ProductModel(name: 'Apple', stock: '1000 ready stock', price: '\$20'),
    ProductModel(name: 'Banana', stock: '1000 ready stock', price: '\$5'),
    ProductModel(name: 'Mango', stock: '1000 ready stock', price: '\$15'),
    ProductModel(name: 'Orange', stock: '1000 ready stock', price: '\$10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
              ),

              //const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: products.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.divider,
                    );
                  },
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductItem(
                      name: product.name,
                      stock: product.stock,
                      price: product.price,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
