import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  IconData icon;
  String hintText;
  TextEditingController controller;
  InputWidget(this.icon, this.hintText, this.controller);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange))),
    );
  }
}
