import 'package:flutter/material.dart';
import '../cards/categoryCard/CategoryCard.dart';
import '../assets/api/CategorysAPI.dart';

class CategoryContent extends StatefulWidget {
  final int selectedIndex;

  const CategoryContent({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  final ScrollController _scrollController = ScrollController();
  final List<Category> _categories = [];
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
    setState(() => _isLoading = true);

    try {
      final newItems = await CategoryAPI().loadCategory(
        page: _currentPage,
        pageSize: _pageSize,
      );

      setState(() {
        _categories.addAll(newItems);
        _currentPage++;
        _hasMore = newItems.length == _pageSize;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fehler beim Laden der Kategorien')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemExtent: screenHeight * 0.20,
      itemCount: _categories.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < _categories.length) {
          final category = _categories[index];
          return CategoryCard(
            uuid: category.uuid,
            name: category.name,
            image: category.imageUrl,
            description: category.description,
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
