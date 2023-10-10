import 'package:flutter/material.dart';

class PratamaPrimaryButton extends StatelessWidget {

  final GestureTapCallback? onTap;
  final Color? color;
  final Color? fontColor;
  final String text;

  const PratamaPrimaryButton({
    super.key,
    this.onTap,
    this.color = const Color.fromARGB(255, 204, 110, 200),
    this.fontColor = Colors.white,
    required this.text
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: color,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}