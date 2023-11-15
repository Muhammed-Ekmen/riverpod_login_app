import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  const RegularTextField({super.key, this.controller, this.widht, this.height, this.hintText, this.icon});
  final TextEditingController? controller;
  final double? widht;
  final double? height;
  final String? hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 30),
        width: widht,
        height: height,
        decoration: _boxDecoration,
        child: _textField,
      );

  get _boxDecoration => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4));

  TextFormField get _textField => TextFormField(
        decoration: _inputDecoration,
        cursorColor: Colors.black,
        controller: controller,
      );

  get _inputDecoration => InputDecoration(
        icon: Icon(icon),
        hintText: hintText ?? "",
      );
}
