// ignore_for_file: prefer_const_constructors

import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTPasswordField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const BTPasswordField(
      {super.key,
      this.label,
      this.placeholder,
      this.controller,
      this.validator});

  @override
  State<BTPasswordField> createState() => _BTPasswordFieldState();
}

class _BTPasswordFieldState extends State<BTPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '${widget.label}',
              style: TextStyle(fontSize: 11.0, color: Colors.indigo),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(PropValues().borderRadius),
                  borderSide: BorderSide.none),
              hintText: '${widget.placeholder}',
              filled: true,
              fillColor: PropValues().secondary,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
