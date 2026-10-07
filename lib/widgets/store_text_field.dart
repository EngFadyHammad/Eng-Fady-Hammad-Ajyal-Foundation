import 'package:flutter/material.dart';

class StoreTextField extends StatefulWidget {
  bool isPassword;

  TextEditingController emailController;
  bool isVisible;

  String hintText;
  Widget? suffixIcon;

  StoreTextField({
    super.key,
    required this.emailController,
    required this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    this.isVisible = true,
  });

  @override
  State<StoreTextField> createState() => _StoreTextFieldState();
}

class _StoreTextFieldState extends State<StoreTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      // isVisible = true معناها الباسورد مخفي
      obscureText: widget.isVisible && widget.isPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: widget.isVisible
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
                onPressed: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
              )
            : widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xff3669C9)),
        ),
      ),
    );
  }
}
