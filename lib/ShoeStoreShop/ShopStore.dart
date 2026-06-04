import 'package:flutter/material.dart';

import 'Shoe.dart';
import 'ShoeData.dart';

class ShopStore extends StatefulWidget {
  const ShopStore({super.key});

  @override
  State<ShopStore> createState() => _ShopStoreState();
}

class _ShopStoreState extends State<ShopStore> {
  List<Shoe> carts = [];
  List<Shoe> productData = ShoeData().shoes;

  void addToCart(Shoe shoe) {
    setState(() {
      var existingShoe = carts.firstWhere(
        (item) => item.name == shoe.name,
        orElse: () => Shoe(name: '', price: 0.0, quantity: 0, imageUrl: ''),
      );

      if (existingShoe.name == '') {
        carts.add(shoe);
      } else {
        existingShoe.quantity++;
      }
    });
  }

  void removeFromCart(Shoe shoe) {
    setState(() {
      if (shoe.quantity > 1) {
        shoe.quantity--;
      } else {
        carts.remove(shoe);
      }
    });
  }

  double getTotal() {
    double total = 0;
    for (var shoe in carts) {
      total += shoe.price * shoe.quantity;
    }
    return total;
  }

  Widget buildItemsWidget(Shoe shoe) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(shoe.imageUrl, width: 150, height: 150),
          Text(
            shoe.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text("${shoe.price} \$", style: TextStyle(fontSize: 20)),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => addToCart(shoe),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text("Thêm vào giỏ", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }

  Widget buildCartItems(Shoe shoe) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Image.network(shoe.imageUrl, width: 50, height: 50),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoe.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Giá: ${shoe.price}\$",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Số lượng: ${shoe.quantity}', style: TextStyle(fontSize: 12)),
            IconButton(
              icon: Icon(Icons.delete_rounded, color: Colors.red),
              onPressed: () => removeFromCart(shoe),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tổng tiền: ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          '${getTotal().toStringAsFixed(2)} \$',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      "Danh Sách Giày",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shoe Store"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Giỏ hàng",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: carts.map((shoe) => buildCartItems(shoe)).toList(),
              ),
            ),

            Divider(),

            SizedBox(height: 20),

            buildTotalPrice(),

            Divider(),

            SizedBox(height: 15),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: productData
                    .map((shoe) => buildItemsWidget(shoe))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
