import 'package:flutter/material.dart';

class TextFieldsTheme {
  static TextFormField createTextField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    void Function(String)? onSubmitted,
  ) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        filled: true,
        fillColor: Colors.white,
      ),
      onFieldSubmitted: onSubmitted,
    );
  }
}