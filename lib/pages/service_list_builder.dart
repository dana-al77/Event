import 'package:flutter/material.dart';
import '../Services/services.dart';
import '../model/services_model.dart';
import '../widget/services_listview.dart';

class ListTypeServicesBuilder extends StatefulWidget {
  const ListTypeServicesBuilder({super.key, required this.id, required this.onServiceSelected, });
  final int id;
  final Function(int) onServiceSelected;

  @override
  State<ListTypeServicesBuilder> createState() => _ListTypeServicesBuilderState();
}

class _ListTypeServicesBuilderState extends State<ListTypeServicesBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServicesModel>>(
      future: Services().getTypeServices(id: widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ServicesModel> TypeServices = snapshot.data!;
          return TypeServiceListView(TypeServices: TypeServices, onServiceSelected: widget.onServiceSelected, );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text("oops there was an error, try late"),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
