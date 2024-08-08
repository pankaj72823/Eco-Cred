import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Provider/product_provider.dart';
import 'package:ecocred/Widgets/Product/product_card.dart';

class Product extends ConsumerWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Shops',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        centerTitle: true,
      ),
      body: productAsyncValue.when(
        data: (products) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(), // Optional: for smooth scrolling
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.45, // Adjusted aspect ratio
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        category: product.category,
                        productName: product.product,
                        imagePath: product.imagePath,
                        carbonReduce: product.carbonReduce,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Failed to load products')),
      ),
    );
  }
}
