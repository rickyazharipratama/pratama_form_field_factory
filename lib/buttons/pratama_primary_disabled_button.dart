import 'package:flutter/material.dart';

class PratamaPrimaryDisabledButton extends StatelessWidget {

  final Color color;
  final String text;
  final Color textColor;

  const PratamaPrimaryDisabledButton({
    super.key,
    this.color = const Color.fromARGB(255, 191, 191, 191),
    required this.text,
    this.textColor = const Color.fromARGB(255, 91, 91, 91)
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}