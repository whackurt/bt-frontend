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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '${widget.label}',
              style: const TextStyle(fontSize: 11.0),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: widget.text,
              labelStyle: TextStyle(color: Colors.grey[800]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
