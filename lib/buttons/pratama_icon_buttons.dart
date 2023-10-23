import 'package:flutter/material.dart';

class PratamaIconButton extends StatelessWidget {

  final GestureTapCallback? onTap;
  final double? size;
  final Color? backgroundColor;
  final Color? color;
  final IconData icon;
  final BorderRadius borderRadius;
  final double areaSize;

  const PratamaIconButton({
    super.key, 
    required this.icon, 
    this.onTap, 
    this.size,
    this.areaSize = 40,
    this.color, 
    this.backgroundColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero
  });


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap??(){},
      child: Container(
        width: areaSize,
        height: areaSize,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor
        ),
        child: Center(
          child: Icon(
            icon,
            size: size ?? 30,
            color: color ?? const Color(0xFF666666)
          )
        ),
      )
    );
  }
}