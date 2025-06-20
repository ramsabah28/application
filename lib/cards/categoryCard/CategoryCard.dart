import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String description;

  const CategoryCard({
    super.key,
    required this.uuid,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image
            Container(
              width: 80,
              height: 80,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            // Text details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const Text(
                    'Verfügbarkeit',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const Text(
                    'Angebot',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // "mehr" link
            TextButton(
              onPressed: () {
                // implement navigation or action using uuid
              },
              child: const Text(
                'mehr',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
