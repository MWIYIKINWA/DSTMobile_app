import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Color color;

  const CustomFloatingButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.color = Colors.blue, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16, // Distance from the bottom
      right: 25,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: color,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
