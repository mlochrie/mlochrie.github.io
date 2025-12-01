// The model for the individual variations (e.g., Plain Croissant, Almond Croissant)
class ProductChoice {
  final int id;
  final String name;
  final String description;
  final double price;

  ProductChoice({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductChoice.fromJson(Map<String, dynamic> json) {
    return ProductChoice(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}

// The model for the top-level product that contains a list of choices
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  // This is the new nested list of sub-products
  final List<ProductChoice>? choices;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.choices,
  });

  // Factory constructor to parse the complete structure
  factory Product.fromJson(Map<String, dynamic> json) {
    // Safely parse the 'choice' array into a List<ProductChoice>
    final List<dynamic>? choicesJson = json['choice'];

    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      choices: choicesJson
          ?.map((e) => ProductChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
