import 'package:flutter/material.dart';

class RadioButtonTile extends StatelessWidget {
  final String value;
  final String title, groupValue;
  final Function(String?) onChanged;
  const RadioButtonTile(
      {super.key,
      required this.value,
      required this.title,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
          Expanded(
              child:
                  Text(title, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
