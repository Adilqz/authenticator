import 'package:flutter/material.dart';


class buttonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const buttonWidget({ Key? key, required this.text, required this.onClicked }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}