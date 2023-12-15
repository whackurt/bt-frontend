import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTRedBtnWithBorder extends StatefulWidget {
  final double? height;
  final String? labelText;
  final Function()? action;
  final IconData? icon;
  const BTRedBtnWithBorder(
      {super.key, this.height, this.labelText, this.action, this.icon});

  @override
  State<BTRedBtnWithBorder> createState() => _BTRedBtnWithBorderState();
}

class _BTRedBtnWithBorderState extends State<BTRedBtnWithBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40.0,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                widget.icon,
                size: 20.0,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text('${widget.labelText}',
                  style: TextStyle(
                    fontSize: PropValues().btnTextSize,
                    color: Colors.red[400],
                  )),
            ],
          ),
        ));
  }
}
