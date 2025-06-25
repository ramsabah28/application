import 'package:flutter/material.dart';
import '../content/HomeContent.dart';
import '../content/CategoryContent.dart';
import '../content/Cart.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int, Widget) onPageChanged;
  final int counter;

  const NavBar({
    Key? key,
    required this.selectedIndex,
    required this.onPageChanged,
    this.counter = 0,
  }) : super(key: key);

  void _handleTap(int index) {
    Widget page;

    switch (index) {
      case 1:
        page = CategoryContent(selectedIndex: index);
        break;
      case 2:
        page = Cart(selectedIndex: index, counter: counter);
        break;
      case 3:
        page = const Center(child: Text("Profil Seite"));
        break;

      default:
        page = HomeContent(selectedIndex: index, counter: counter);
        break;
      //TODO: Fix
    }

    onPageChanged(index, page);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _handleTap,
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
    );
  }
}
