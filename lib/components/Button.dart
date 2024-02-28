import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? bgColor;
  final String? text;
  MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(40),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          text!,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
