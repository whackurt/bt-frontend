import 'package:flutter/material.dart';

class BTUnderlinedTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  const BTUnderlinedTextField(
      {super.key, this.hintText, this.labelText, this.controller});

  @override
  State<BTUnderlinedTextField> createState() => _BTUnderlinedTextFieldState();
}

class _BTUnderlinedTextFieldState extends State<BTUnderlinedTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.labelText}',
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: '${widget.hintText}',
                border: const UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
