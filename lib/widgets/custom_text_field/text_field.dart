import 'package:flutter/material.dart';

class BTTextField extends StatefulWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const BTTextField(
      {super.key, this.placeholder, this.controller, this.validator});

  @override
  State<BTTextField> createState() => _BTTextFieldState();
}

class _BTTextFieldState extends State<BTTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '${widget.placeholder}',
                filled: true,
                fillColor: Colors.white,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator),
        ],
      ),
    );
  }
}
