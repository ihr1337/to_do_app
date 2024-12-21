import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String label;
  final BaseButtonStyle style;
  final VoidCallback onTap;

  const BaseButton({
    super.key,
    required this.label,
    required this.style,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: style.height,
      child: Material(
        color: style.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          highlightColor: style.highlightColor,
          splashColor: style.highlightColor,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: style.labelColor),
            ),
          ),
        ),
      ),
    );
  }
}

class BaseButtonStyle {
  final double height;
  final Color color;
  final Color highlightColor;
  final Color labelColor;
  final BorderSide borderSide;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  BaseButtonStyle({
    this.height = 56.0,
    this.color = Colors.grey,
    this.highlightColor = Colors.white70,
    this.labelColor = Colors.black,
    this.borderSide = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
    this.padding = const EdgeInsets.all(10.0),
  });

  BaseButtonStyle.confirm({
    this.height = 56.0,
    this.color = Colors.green,
    this.highlightColor = Colors.white24,
    this.labelColor = Colors.white,
    this.borderSide = const BorderSide(width: 1),
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
    this.padding = const EdgeInsets.all(10.0),
  });

  BaseButtonStyle.cancel({
    this.height = 56.0,
    this.color = Colors.red,
    this.highlightColor = Colors.white24,
    this.labelColor = Colors.white,
    this.borderSide = const BorderSide(width: 1),
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
    this.padding = const EdgeInsets.all(10.0),
  });
}
