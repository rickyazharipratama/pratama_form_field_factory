import 'package:flutter/material.dart';

class PratamaFilledSecondaryButton extends StatelessWidget {

  final VoidCallback? onTap;
  final String text;
  final Color textColor;


  const PratamaFilledSecondaryButton(
    {
      super.key,
      this.onTap,
      required this.text,
      this.textColor = Colors.white
    }
  );
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.transparent,
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
      ),
    );
  }
}