import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTRedBtnWithBorder extends StatefulWidget {
  final double? height;
  final String? labelText;
  final Function()? action;
  const BTRedBtnWithBorder(
      {super.key, this.height, this.labelText, this.action});

  @override
  State<BTRedBtnWithBorder> createState() => _BTRedBtnWithBorderState();
}

class _BTRedBtnWithBorderState extends State<BTRedBtnWithBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(PropValues().borderRadius),
            border: Border.all(
                color: const Color.fromARGB(255, 197, 19, 16)) // Border radius
            ),
        child: TextButton(
          onPressed: widget.action,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          child: Text('${widget.labelText}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: Color.fromARGB(255, 197, 19, 16),
              )),
        ));
  }
}
