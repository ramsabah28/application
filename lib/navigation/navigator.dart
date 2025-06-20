import 'package:flutter/material.dart';
import '../header/header.dart';
import '../content/HomeContent.dart';
import '../content/CategoryContent.dart';
import '../content/Cart.dart';
import '../product/singleView/SingleProduct.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.title});

  final String title;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _onFooterButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (_selectedIndex) {
      case 1: // Search tab index
        content = CategoryContent(selectedIndex: _selectedIndex);
        break;

      case 2: // Search tab index
        content = Cart(selectedIndex: _selectedIndex, counter: _counter);
        break;
      // Placeholder for cards: TODO: see card impl
      case 3: // Search tab index
        content = SingleProduct();
        break;

      default:
        content = HomeContent(selectedIndex: _selectedIndex, counter: _counter);
        break;
    }

    return Scaffold(
      appBar: const Header(),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onFooterButtonTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1668D7),
        unselectedItemColor: const Color(0xFF1668D7),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Warenkorb',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
