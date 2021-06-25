import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String) onChanged;
  final bool? enabled;
  CustomTextField({
    this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.textInputType,
    required this.onChanged,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(32)),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintText: hint,
            border: InputBorder.none),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
