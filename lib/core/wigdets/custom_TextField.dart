import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.conf = "",
    this.a = 50,
    this.keyboard = TextInputType.text,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.onChanged,
    required this.con,
    super.key,
  });
  final String conf;
  final int a;
  final TextInputType keyboard;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Function(String) onChanged;
  final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 25),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field is requried";
          }
          if (hintText == "Confirm Password") {
            if (value != conf) {
              return "Password didn't match";
            }
          }
          return null;
        },
        maxLength: a,
        keyboardType: keyboard,
        controller: con,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: "SF",
          color: Colors.black,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "SF",
            color: Colors.black,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorStyle: const TextStyle(fontFamily: "SF"),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(color: Colors.red.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
