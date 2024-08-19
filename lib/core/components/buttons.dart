import 'package:flutter/material.dart';
import '../constants/colors.dart';

enum ButtonStyleType { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyleType.filled,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 54.0,
    this.borderRadius = 8.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyleType.outlined,
    this.color = Colors.transparent,
    this.textColor = AppColors.primary,
    this.width = double.infinity,
    this.height = 54.0,
    this.borderRadius = 8.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
  });

  final VoidCallback onPressed;
  final String label;
  final ButtonStyleType style;
  final Color color;
  final Color textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool disabled;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyleType.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: color,
                side: const BorderSide(color: AppColors.stroke),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight),
                  ),
                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 10.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            ),
    );
  }
}
