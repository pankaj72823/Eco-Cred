import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Product {
  final String category;
  final String product;
  final int carbonReduce;
  final String imagePath;
  final String brand;

  Product({
    required this.category,
    required this.product,
    required this.carbonReduce,
    required this.imagePath,
    required  this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      category: json['category'],
      product: json['product'],
      brand: json['brand'],
      carbonReduce: json['carbon_reduce'],
      imagePath: determineImagePath(json['brand']),
    );
  }
}


String determineImagePath(String name) {
  switch (name) {
    case 'Skoy':
      return 'lib/assets/Products/Skoy_product.jpg';
    case 'Aveeno':
      return 'lib/assets/Products/Avvenos_bath.jpg';
    case 'Baggu':
      return 'lib/assets/Products/Baggu.jpg';
    case 'Norm':
      return 'lib/assets/Products/Norm.jpg';
    case 'Tsuno':
      return 'lib/assets/Products/tusno.jpg';
    case 'Flip & Tumble':
      return 'lib/assets/Products/Flip_Tumble.png';
    case 'joy':
      return 'lib/assets/Products/Joy_Shampoo.jpg';
    default:
      return 'assets/images/default.png';
  }
}

// Define a FutureProvider to fetch the list of products
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http.get(Uri.parse('http://localhost:5050/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
});
