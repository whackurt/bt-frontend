import 'package:flutter/material.dart';

class BTTextField extends StatefulWidget {
  final String? placeholder;
  const BTTextField({super.key, this.placeholder});

  @override
  State<BTTextField> createState() => _BTTextFieldState();
}

class _BTTextFieldState extends State<BTTextField> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '${widget.placeholder}',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
