import 'package:flutter/material.dart';
import '../../assets/api/ProductsAPI.dart';

class SingleProduct extends StatefulWidget {
  final String uuid;
  final VoidCallback? onBack;

  const SingleProduct({super.key, required this.uuid, this.onBack});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  late Future<Product> _productFuture;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _productFuture = _loadSingleProduct();
  }

  Future<Product> _loadSingleProduct() async {
    final api = ProductsAPI();
    final products = await api.loadProducts();

    if (products.isNotEmpty) {
      return products.firstWhere(
        (p) => p.uuid == widget.uuid,
        orElse: () => products.first,
      );
    } else {
      throw Exception('No products found');
    }
  }

  void _onNavBarTap(int index, Widget page) {
    Navigator.of(context).pop(); // Exit current SingleProduct screen
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: _productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final product = snapshot.data!;

          return ListView.builder(
            itemCount: 1, // Just one item to show a string
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  product.name, // Replace this with any string
                  style: const TextStyle(fontSize: 24),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No product found'));
        }
      },
    );
  }
}
