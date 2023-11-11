import 'package:flutter/material.dart';

class BTReadonlyTextField extends StatefulWidget {
  final String? label;
  final String? text;

  const BTReadonlyTextField({super.key, this.label, this.text});

  @override
  State<BTReadonlyTextField> createState() => _BTReadonlyTextFieldState();
}

class _BTReadonlyTextFieldState extends State<BTReadonlyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.label}',
            style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8.0), // Spacer
          Text(
            '${widget.text}',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0), // Spacer
          Container(
            height: 1.0,
            color: Colors.grey[600], // Underline color
          ),
        ],
      ),
    );
  }
}
