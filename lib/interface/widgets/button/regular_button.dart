import 'package:flutter/material.dart';

class RegularButton extends StatelessWidget {
  const RegularButton({super.key, required this.onPressed, required this.label});
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: _elevatedButton,
      );

  get _elevatedButton => ElevatedButton(
        style: _elevatedButtonStyle,
        onPressed: onPressed,
        child: Text(label),
      );

  get _elevatedButtonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      );
}
