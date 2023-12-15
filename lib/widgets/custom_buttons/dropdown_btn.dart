import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTDropdownBtn extends StatefulWidget {
  final Function()? onChange;
  final List<String>? dropdownValues;
  final String? hint;
  const BTDropdownBtn(
      {super.key, this.onChange, this.dropdownValues, this.hint});

  @override
  State<BTDropdownBtn> createState() => _BTDropdownBtnState();
}

class _BTDropdownBtnState extends State<BTDropdownBtn> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PropValues().borderRadius),
          color: PropValues().secondary,
        ),
        child: DropdownButton<String>(
          value: selectedValue,
          underline: Container(),
          isExpanded: true,
          hint: Text('${widget.hint}'),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: widget.dropdownValues
              ?.map<DropdownMenuItem<String>>((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 30.0,
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
