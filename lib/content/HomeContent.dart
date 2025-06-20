import 'package:flutter/material.dart';
import '../cards/productCard/ProductCard.dart';
import '../assets/api/ProductsAPI.dart';

class HomeContent extends StatefulWidget {
  final int selectedIndex;
  final int counter;

  const HomeContent({
    super.key,
    required this.selectedIndex,
    required this.counter,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final ScrollController _scrollController = ScrollController();
  final List<Product> _products = [];
  bool _isLoading = false;
  int _currentPage = 0;

  final int _pageSize = 10;

  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadMore();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    try {
      final newItems = await ProductsAPI().loadProducts(
        page: _currentPage,
        pageSize: _pageSize,
      );

      setState(() {
        _products.addAll(newItems);
        _currentPage++;
        _hasMore = newItems.length == _pageSize;
        _isLoading = false;
      });
    } catch (exception) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load Products!")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemExtent: screenHeight * 0.40,
      itemCount: _products.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < _products.length) {
          final product = _products[index];
          return ProductCard(
            uuid: product.uuid,
            title: product.name,
            imageUrl: product.imageUrl,
            description: product.description,
            brand: '',
            price: 00,
            rating: 00,
            ratingCount: 00,
            purchaseInfo: '',
            colors: [],
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
