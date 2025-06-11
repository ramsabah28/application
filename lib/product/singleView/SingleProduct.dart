import 'package:flutter/material.dart';
import '../../templates/buttons/PrimaryButton.dart';
import '../../templates/buttons/SecondaryButton.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hitway', style: TextStyle(fontSize: 12)),
            SizedBox(height: 4),
            Text(
              'E-Bike Mountainbike 26*4,0 Zoll',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image with rounded corners
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://i.otto.de/i/otto/948e48ee-2611-4535-b6c0-33a76ac07647?h=1040&w=1102&qlt=40&unsharp=0,1,0.6,7&sm=clamp&upscale=true&fmt=auto',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Product title
            const Divider(color: Colors.black26, thickness: 1),
            const Text(
              'Awesome Product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Product description
            const Text(
              'This is a detailed description of the product. It includes features, benefits, and any other relevant information the customer might want to know.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Center(
              child: PrimaryButton(
                paddingVertical: 1,
                label: "In den Warenkorp",
                onPressed: () {}, // do nothing, but button is active
              ),
            ),
            Center(
              child: SecondaryButton(
                label: "Artekle Merken",
                paddingVertical: 1,
                onPressed: () {}, // do nothing, but button is active
              ),
            ),
          ],
        ),
      ),
    );
  }
}
