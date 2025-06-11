import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;


  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.paddingVertical = 14.0,
    this.paddingHorizontal = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorSchemae = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSchemae.onPrimary,
        foregroundColor: textColor,
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
