import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      elevation: 0,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white, // changed from white.withOpacity(0.15) to solid white
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.black54), // darker icon for white bg
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.black), // dark text on white bg
                decoration: const InputDecoration(
                  hintText: 'Suche...',
                  hintStyle: TextStyle(color: Colors.black45), // lighter hint color
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Benachrichtigungen',
          color: Colors.white,
          onPressed: () {
            // Add your notification logic here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
