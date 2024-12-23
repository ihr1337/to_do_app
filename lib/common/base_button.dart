import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final BaseButtonStyle style;
  final BaseButtonStyle? disabledStyle;
  final VoidCallback onTap;

  const BaseButton({
    super.key,
    required this.label,
    this.enabled = true,
    required this.style,
    this.disabledStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = (enabled ? style : disabledStyle) ?? style;

    return SizedBox(
      height: buttonStyle.height,
      child: Material(
        color: buttonStyle.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: enabled ? onTap : null,
          highlightColor: buttonStyle.highlightColor,
          splashColor: buttonStyle.highlightColor,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: buttonStyle.labelColor),
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
