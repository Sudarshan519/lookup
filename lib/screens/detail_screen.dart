import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(child: Image.network(image)),
    );
  }
}