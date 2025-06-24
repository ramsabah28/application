import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {


  final String label;
  final VoidCallback onPressed;

  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,

    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.paddingVertical = 14.0,
    this.paddingHorizontal = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: textColor,
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: Size(100, 48),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}