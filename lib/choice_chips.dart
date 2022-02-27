import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  const MultiSelectChip({Key? key, required this.serviceList, required this.onSelectionChnaged}) : super(key: key);
  final Function(List<String>) onSelectionChnaged;
  final List<String> serviceList;

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;
  List<String> selectedChoice = [];
  //String selectedChoice = "";
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }

  _buildChoiceList() {
    List<Widget> choices = [];

    for (String item in widget.serviceList) {
      choices.add(Container(
          padding: const EdgeInsets.all(2.0),
          child: ChoiceChip(
            label: Text(item),
            selected: selectedChoice.contains(item),
            onSelected: (selected) {
              setState(() {
                selectedChoice.contains(item) ? selectedChoice.remove(item) : selectedChoice.add(item);
                widget.onSelectionChnaged(selectedChoice);
              });
            },
          )));
    }
    return choices;
  }
}
