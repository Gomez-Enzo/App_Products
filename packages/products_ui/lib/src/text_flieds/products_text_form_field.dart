import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

/// {@template products_text_field}
/// A [TextField] with Products styling.
/// {@endtemplate}
class ProductsTextFormField extends StatefulWidget {
  /// {@macro products_text_field}
  const ProductsTextFormField({
    required this.handlePassword,
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.controller,
  });

  /// Whether the text field will manage sensitive information.
  final bool handlePassword;

  /// The inital Value to display.
  final String? initialValue;

  /// The hint text to display.
  final String? hintText;

  /// The label text to display.
  final String? labelText;

  /// The [TextInputType] of the text field.
  final TextInputType? keyboardType;

  /// The validator of the text field.
  final String? Function(String? text)? validator;

  /// the onChanged for the text field.
  final void Function(String)? onChanged;

  /// the controller for the text field.
  final TextEditingController? controller;

  @override
  State<ProductsTextFormField> createState() => _ProductsTextFormFieldState();
}

class _ProductsTextFormFieldState extends State<ProductsTextFormField> {
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.handlePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2.sp,
          ),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: widget.handlePassword
            ? Padding(
                padding: EdgeInsets.only(right: 8.sp),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 22.sp,
                    color: const Color(0xff898989),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
