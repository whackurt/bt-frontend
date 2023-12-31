// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTTextFieldWithLabel extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const BTTextFieldWithLabel(
      {Key? key, this.label, this.placeholder, this.controller, this.validator})
      : super(key: key);

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
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(PropValues().borderRadius),
                    borderSide: BorderSide.none),
                // labelText: widget.label,
                filled: true,
                fillColor: PropValues().secondary,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
