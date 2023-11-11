import 'package:flutter/material.dart';

class BTDropdownMenu extends StatefulWidget {
  final Function()? onChange;
  final List<String>? dropdownValues;
  final String? hint;
  final String? label;
  const BTDropdownMenu(
      {super.key, this.onChange, this.dropdownValues, this.hint, this.label});

  @override
  State<BTDropdownMenu> createState() => _BTDropdownMenuState();
}

class _BTDropdownMenuState extends State<BTDropdownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('${widget.label}'),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
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
                  ?.map<DropdownMenuItem<String>>((String itemValue) {
                return DropdownMenuItem<String>(
                  value: itemValue,
                  child: Text(itemValue),
                );
              }).toList(),
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 30.0,
              dropdownColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
