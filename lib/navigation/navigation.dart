import 'package:flutter/material.dart';
import '../content/HomeContent.dart';
import '../header/header.dart';
import 'NavBar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.title});

  final String title;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _counter = 0;
  int _selectedIndex = 0;
  late Widget _content;

  @override
  void initState() {
    super.initState();

    _content = HomeContent(selectedIndex: 0, counter: _counter);
  }

  void _onPageChanged(int index, Widget newContent) {
    setState(() {
      _selectedIndex = index;
      _content = newContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: _content,
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        counter: _counter,
        onPageChanged: _onPageChanged,
      ),
    );
  }
}
