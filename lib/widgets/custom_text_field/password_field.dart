// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BTPasswordField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? textController;

  const BTPasswordField({
    super.key,
    this.label,
    this.placeholder,
    this.textController,
  });

  @override
  State<BTPasswordField> createState() => _BTPasswordFieldState();
}

class _BTPasswordFieldState extends State<BTPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('${widget.label}'),
          ),
          TextField(
            controller: widget.textController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '${widget.placeholder}',
              filled: true,
              fillColor: Colors.white,
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
