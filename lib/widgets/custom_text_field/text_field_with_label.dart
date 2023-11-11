// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:flutter/material.dart';

class BTTextFieldWithLabel extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? textController;

  const BTTextFieldWithLabel({
    Key? key,
    this.label,
    this.placeholder,
    this.textController,
  }) : super(key: key);

  @override
  _BTTextFieldWithLabelState createState() => _BTTextFieldWithLabelState();
}

class _BTTextFieldWithLabelState extends State<BTTextFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('${widget.label}'),
          ),
          TextField(
            controller: widget.textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '${widget.placeholder}',
              filled: true,
              fillColor: Colors.white,
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
