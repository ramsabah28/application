import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final int selectedIndex;
  final int counter;

  const Cart({super.key, required this.selectedIndex, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Cart View $selectedIndex'),
          const SizedBox(height: 10),
          Text('Counter: $counter'),
        ],
      ),
    );
  }
}
