import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class StretchedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderSide? borderSide;

  const StretchedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.margin,
    this.backgroundColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: screenWidth(8)),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          side: borderSide,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          backgroundColor: backgroundColor ?? AppColors.purple3D0,
          minimumSize: Size.fromHeight(screenHeight(16)),
        ),
        child: child,
      ),
    );
  }
}
