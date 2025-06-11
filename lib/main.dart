import 'package:flutter/material.dart';
import 'navigation/navigator.dart';
import 'assets/api/ProductsAPI.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final products =  ProductsAPI().loadProducts();
    print("#########");
    products.asStream().forEach((productList) {
      for (var product in productList) {
        print(product);
        print("#########");
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Footer Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFCAC9C9),
          onPrimary: Color(0xFF1668D7),
          secondary: Color(0xFFA0A0A0),
          onSecondary: Color(0xFF1B1B1C),
          background: Color(0xFFF3F3F6),
          onBackground: Color(0xFF1B1B1C),
          surface: Color(0xFFF3F3F6),
          onSurface: Color(0xFF1B1B1C),
          error: Colors.red,
          onError: Colors.white,
        ),
      ),

      home: const Navigation(title: 'Flutter Demo Home Page'),


    );
  }
}


