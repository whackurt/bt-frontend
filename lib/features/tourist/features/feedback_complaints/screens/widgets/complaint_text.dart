import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '${widget.fieldTitle}',
            style: const TextStyle(color: Colors.indigo, fontSize: 12.0),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          decoration: BoxDecoration(
              color: PropValues().secondary,
              borderRadius:
                  BorderRadius.all(Radius.circular(PropValues().borderRadius))),
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
