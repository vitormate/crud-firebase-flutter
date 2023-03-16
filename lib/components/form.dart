import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  Forms({super.key, required this.controller});

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(248, 250, 255, 1),
          contentPadding: const EdgeInsets.fromLTRB(22, 8, 0, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
