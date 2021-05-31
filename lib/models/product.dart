class Product {
  String photo;
  String name;
  String features;
  double price;
  String price_description;
  bool isFavorite;

  Product({
    required this.photo,
    required this.name,
    required this.features,
    required this.price,
    required this.price_description,
    this.isFavorite = false,
  });
}
