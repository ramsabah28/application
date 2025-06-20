import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String uuid;
  final String imageUrl;
  final String brand;
  final String title;
  final String description;
  final double price;
  final int ratingCount;
  final double rating;
  final String purchaseInfo;
  final List<Color> colors;

  const ProductCard({
    super.key,
    required this.uuid,
    required this.imageUrl,
    required this.brand,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.purchaseInfo,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Product Image
            Row(
              children: [
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brand,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "€${price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            // Rating and purchase info
            Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: index < rating ? Colors.amber : Colors.grey[300],
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '$ratingCount',
                  style: const TextStyle(color: Colors.blue),
                ),
                const Spacer(),
                Text(
                  purchaseInfo,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            const SizedBox(height: 6),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'GRATIS Lieferung 16–18. Mai',
                style: TextStyle(fontSize: 12),
              ),
            ),

            const SizedBox(height: 10),

            // Color options
            Row(
              children: colors
                  .map(
                    (color) => Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 12),

            // Add to Cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'In den Einkaufswagen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
