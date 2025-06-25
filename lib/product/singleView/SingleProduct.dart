import 'package:flutter/material.dart';
import '../../templates/buttons/PrimaryButton.dart';
import '../../templates/buttons/SecondaryButton.dart';
import '../../assets/api/ProductsAPI.dart';
import '../../header/header.dart';
import '../../navigation/NavBar.dart';

class SingleProduct extends StatefulWidget {
  final String uuid;

  const SingleProduct({super.key, required this.uuid});

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
    ProductsAPI api = ProductsAPI();
    List<Product> products = await api.loadProducts();
    if (products.isNotEmpty) {
      return products.first;
    } else {
      throw Exception('No products found');
    }
  }

  void _onPageChanged(int index, Widget page) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
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
            appBar: const Header(),
            body: Center(child: Text("Error: ${snapshot.error}")),
            bottomNavigationBar: NavBar(
              selectedIndex: _selectedIndex,
              onPageChanged: _onPageChanged,
            ),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            appBar: Header(),
            body: Center(child: Text("No product found")),
          );
        }

        final product = snapshot.data!;

        return Scaffold(
          appBar: const Header(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
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
                const SizedBox(height: 24),
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
          bottomNavigationBar: NavBar(
            selectedIndex: _selectedIndex,
            onPageChanged: _onPageChanged,
          ),
        );
      },
    );
  }
}
