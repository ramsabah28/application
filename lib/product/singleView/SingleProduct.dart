import 'package:flutter/material.dart';
import '../../templates/buttons/PrimaryButton.dart';
import '../../templates/buttons/SecondaryButton.dart';
import '../../assets/api/ProductsAPI.dart';

class SingleProduct extends StatefulWidget {
  final String uuid;

  const SingleProduct({super.key, required this.uuid});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  late Future<Product> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _loadSingleProduct();
  }

  Future<Product> _loadSingleProduct() async {
    ProductsAPI api = ProductsAPI();
    List<Product> products = await api.loadProducts();
    if (products.isNotEmpty) {
      return products.first;
    } else {
      throw Exception('No products found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: _productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: Text("No product found")),
          );
        }

        final product = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.producer, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Text(
                  product.productTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      product.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.black26, thickness: 1),
                Text(
                  product.productTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Center(
                  child: PrimaryButton(
                    paddingVertical: 1,
                    label: "In den Warenkorb",
                    onPressed: () {},
                  ),
                ),
                Center(
                  child: SecondaryButton(
                    label: "Artikel merken",
                    paddingVertical: 1,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
