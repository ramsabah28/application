import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  final int selectedIndex;
  final int counter;

  const CategoryContent({
    super.key,
    required this.selectedIndex,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Category View: $selectedIndex'),
          const SizedBox(height: 10),
          Text('Counter: $counter'),
        ],
      ),
    );
  }
}
