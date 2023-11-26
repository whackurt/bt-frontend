import 'package:flutter/material.dart';

class BTComplaintText extends StatefulWidget {
  final String? value;
  final String? fieldTitle;
  const BTComplaintText({super.key, this.value, this.fieldTitle});

  @override
  State<BTComplaintText> createState() => _BTComplaintTextState();
}

class _BTComplaintTextState extends State<BTComplaintText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.fieldTitle}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .85,
            child: Text(
              '${widget.value}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
              ),
              maxLines: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
