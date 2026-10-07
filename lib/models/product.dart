class Product {
  // attr
  String name;
  double price;
  String imagePath;
  String size;
  int quantity;
  String details;
  String category;

  // constructor

  Product({
    required this.price,
    required this.imagePath,
    required this.name,
    required this.details,
    required this.quantity,
    required this.size,
    required this.category,
  });
}
