import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscure,
    this.contentPaddingLeft,
    this.contentPaddingRight,
    this.contentPaddingTop,
    this.contentPaddingBottom,
    this.textAlign,
    this.textSize,
    this.circularSize,
    this.typeInput,
    this.validator,
    this.prefixIcon,
    this.fontSize,
    this.suffixIcon,
    this.borderColor,
    this.colorHintText,
    this.widthBorder,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
  });
  final String hintText;
  final TextEditingController controller;
  final bool? obscure;
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? contentPaddingTop;
  final double? contentPaddingBottom;
  final TextAlign? textAlign;
  final double? textSize;
  final double? circularSize;
  final TextInputType? typeInput;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final double? fontSize;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? colorHintText;
  final double? widthBorder;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      keyboardType: widget.typeInput ?? TextInputType.text,
      textAlign: widget.textAlign ?? TextAlign.center,
      obscureText: widget.obscure ?? false,
      controller: widget.controller,
      style: TextStyle(
        fontSize: widget.textSize ?? screenWidth(25),
        color: AppColors.mainBlackColor,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.widthBorder ?? 1,
            color: widget.borderColor ?? AppColors.purple3D0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.circularSize ?? screenWidth(30)),
          ),
        ),
        //suffixIconColor: AppColors.mainYellowColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.widthBorder ?? 1,
            color: AppColors.purple3D0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.circularSize ?? screenWidth(30)),
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        hintStyle: TextStyle(
          color: widget.colorHintText ?? AppColors.mainGreyColor,
          fontSize: widget.fontSize ?? screenWidth(24),
        ),
        contentPadding: EdgeInsetsDirectional.only(
          start: widget.contentPaddingLeft ?? 0,
          end: widget.contentPaddingRight ?? 0,
          top: widget.contentPaddingTop ?? 0,
          bottom: widget.contentPaddingBottom ?? 0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.widthBorder ?? 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.circularSize ?? screenWidth(30)),
          ),
        ),
      ),
    );
  }
}
