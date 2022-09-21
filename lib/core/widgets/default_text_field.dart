import 'package:flutter/material.dart';

Widget defaultTextField(
        {required TextEditingController controller,
        required TextInputType textInputType,
        Function? onSubmit,
        Function? onChange,
        Function? onTap,
        required Function validator,
        required String placeholderString,
        required IconData prefix,
        IconData? suffixIcon,
        Function? suffixPressed,
        bool isClickable = true,
        bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      enabled: isClickable,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        if (onSubmit != null) {
          onSubmit(s);
        }
      },
      onChanged: (s) {
        if (onChange != null) {
          onChange(s);
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap(); // Safe
        }
      },
      validator: (s) {
        return validator(s);
      },
      decoration: InputDecoration(
          label: Text(placeholderString),
          prefixIcon: Icon(prefix),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    if (suffixPressed != null) {
                      suffixPressed();
                    }
                  },
                  icon: Icon(suffixIcon))
              : null),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
