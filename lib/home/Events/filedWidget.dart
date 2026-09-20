import 'package:flutter/material.dart';

class eventFileds extends StatelessWidget {
  const eventFileds({
    super.key,
    required this.screanheigth,
    required this.controller,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String text;

  final double screanheigth;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screanheigth,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          expands: true,
          controller: controller,
          maxLines: null,
          minLines: null,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Theme.of(context).disabledColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Theme.of(context).disabledColor),
            ),
            hint: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Theme.of(context).disabledColor),
            ),
          ),
        ),
      ),
    );
  }
}
