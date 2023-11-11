import 'package:flutter/material.dart';

class BTWhiteBtnWithBorder extends StatefulWidget {
  final double? height;
  final String? labelText;
  final Function()? action;
  const BTWhiteBtnWithBorder(
      {super.key, this.height, this.labelText, this.action});

  @override
  State<BTWhiteBtnWithBorder> createState() => _BTWhiteBtnWithBorderState();
}

class _BTWhiteBtnWithBorderState extends State<BTWhiteBtnWithBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0), // Border radius
        border: Border.all(
          color: const Color.fromARGB(255, 134, 134, 134), // Border color
          width: 1.0, // Border width
        ),
      ),
      child: TextButton(
          onPressed: widget.action,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            '${widget.labelText}',
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Color.fromARGB(255, 68, 68, 68)),
          )),
    );
  }
}
