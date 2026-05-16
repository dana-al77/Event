import 'package:flutter/material.dart';
import '../model/secondary_service.dart';

class CheckBoxListView extends StatefulWidget {
  const CheckBoxListView({Key? key, required this.CheckBoxList, required this.onSelectedServicesChanged}) : super(key: key);

  final List<SecondaryServiceModel> CheckBoxList;
  final ValueChanged<List<String>> onSelectedServicesChanged;

  @override
  State<CheckBoxListView> createState() => _CheckBoxListViewState();
}

class _CheckBoxListViewState extends State<CheckBoxListView> {
  bool _checkAll = false;
  List<String> selectedServices = [];

  void _toggleServices(String service) {
    setState(() {
      if (selectedServices.contains(service)) {
        selectedServices.remove(service);
      } else {
        selectedServices.add(service);
      }
      widget.onSelectedServicesChanged(selectedServices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          CheckboxListTile(
            activeColor: Colors.purpleAccent,
            controlAffinity: ListTileControlAffinity.leading,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Allow all", style: TextStyle(color: Colors.grey, fontFamily: 'Angkor')),
              ],
            ),
            value: _checkAll,
            onChanged: (value) {
              setState(() {
                _checkAll = value!;
                if (value) {
                  selectedServices.clear(); // Clear the selected list if "Allow All" is checked
                  widget.CheckBoxList.forEach((element) {
                    element.selected = true; // Select all services
                    selectedServices.add(element.name);
                  });
                } else {
                  selectedServices.clear(); // Clear the selected list if "Allow All" is unchecked
                  widget.CheckBoxList.forEach((element) {
                    element.selected = false; // Deselect all services
                  });
                }
                widget.onSelectedServicesChanged(selectedServices);
              });
            },
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.CheckBoxList.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                activeColor: Colors.purpleAccent,
                controlAffinity: ListTileControlAffinity.leading,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [Text(widget.CheckBoxList[index].name, style: TextStyle(color: Colors.grey, fontFamily: 'Angkor'))],
                    ),
                    Row(
                      children: [
                        Text("${widget.CheckBoxList[index].Price} \$", style: TextStyle(color: Colors.purple, fontFamily: 'Angkor')),
                      ],
                    ),
                  ],
                ),
                value: selectedServices.contains(widget.CheckBoxList[index].name),
                onChanged: (value) {
                  setState(() {
                    widget.CheckBoxList[index].selected = value!;
                    _toggleServices(widget.CheckBoxList[index].name);

                    final allSelected = widget.CheckBoxList.every((element) => element.selected);
                    final allDeselected = widget.CheckBoxList.every((element) => !element.selected);

                    _checkAll = allSelected;
                    if (allDeselected) {
                      _checkAll = false;
                    }
                    widget.onSelectedServicesChanged(selectedServices);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
