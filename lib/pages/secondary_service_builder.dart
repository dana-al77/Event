import 'package:flutter/material.dart';
import '../Services/secondary_service.dart';
import '../model/secondary_service.dart';
import '../widget/secodary_service_list.dart';


class CheckBoxListBuilder extends StatefulWidget {
  const CheckBoxListBuilder({super.key, required this.id, required this.onSelectedServicesChanged});
  final int id;
  final ValueChanged<List<String>> onSelectedServicesChanged;

  @override
  State<CheckBoxListBuilder> createState() => _CheckBoxListBuilderState();
}

class _CheckBoxListBuilderState extends State<CheckBoxListBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SecondaryServiceModel>>(
        future: SecondaryServices().getCheckBoxServices(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SecondaryServiceModel> CheckBoxList = snapshot.data!;
            return CheckBoxListView(CheckBoxList: CheckBoxList, onSelectedServicesChanged: widget.onSelectedServicesChanged);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text("oops there was an error, try late"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
