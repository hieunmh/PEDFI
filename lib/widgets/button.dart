import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Color textColor;
  final Color buttonColor;
  final String textContent;
  final Function()? ontap;

  const Button({
    super.key,
    required this.textColor,
    required this.buttonColor,
    required this.textContent,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            textContent,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}