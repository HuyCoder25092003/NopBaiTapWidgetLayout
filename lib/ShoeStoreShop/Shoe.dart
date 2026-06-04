class Shoe {
  String name;
  double price;
  int quantity;
  String imageUrl;

  Shoe({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,
  });
}
