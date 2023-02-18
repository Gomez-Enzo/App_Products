import 'dart:convert';

/// {@template product}
/// A class that represents a product
/// {@endtemplate}
class Product {
  /// {@template product}
  Product({
    this.available,
    this.name,
    this.price,
    this.id,
    this.picture,
  });

  factory Product.fromJson(String str) =>
      Product.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  /// Returns a new [Product] with the given [Map<String, dynamic>]
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json['available'] as bool?,
        name: json['name'] as String?,
        picture: json['picture'] as String?,
        price: json['price'] as num?,
      );

  /// Converts a Json into a map
  Map<String, dynamic> toMap() => {
        'available': available,
        'name': name,
        'picture': picture,
        'price': price,
      };

  /// the availability of the product
  final bool? available;

  /// The name of the product
  final String? name;

  /// The image of the product
  final String? picture;

  /// The price of the product
  final num? price;

  /// ID of the product.
  String? id;
}
