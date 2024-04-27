import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.fontSize,
    required this.borderRadiusGeometry,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double fontSize;
  final void Function()? onTap;
  final Color backgroundColor, foregroundColor;
  final EdgeInsetsGeometry margin, padding;
  final BorderRadiusGeometry borderRadiusGeometry;
  final TextAlign textAlign;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadiusGeometry,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.foregroundColor,
            fontSize: widget.fontSize,
          ),
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
