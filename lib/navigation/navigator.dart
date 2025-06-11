import 'package:flutter/material.dart';
import '../header/header.dart';
import '../content/HomeContent.dart';
import '../content/CategoryContent.dart';
import '../content/Cart.dart';
import '../cards/productCard/ProductCard.dart';

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
        content = CategoryContent(
          selectedIndex: _selectedIndex,
          counter: _counter,
        );
        break;

      case 2: // Search tab index
        content = Cart(
          selectedIndex: _selectedIndex,
          counter: _counter,
        );
        break;

      case 3: // Search tab index
        content = ProductCard(
          imageUrl: "https://i.otto.de/i/otto/9d7b70d5-7ebd-5c09-b3c3-5a7af655496b?h=1040&w=1102&qlt=40&unsharp=0,1,0.6,7&sm=clamp&upscale=true&fmt=auto",
          brand: "",
            title: "",
            description:"",
            price:00.0,
            ratingCount:00,
            rating:00.0,
            purchaseInfo:"",
            colors:[]

        );
        break;

      default:
        content = HomeContent(
          selectedIndex: _selectedIndex,
          counter: _counter,
        );
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Warenkorb'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
