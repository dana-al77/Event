import 'package:flutter/material.dart';
import 'package:untitled11/pages/secondary_service_builder.dart';

import '../model/services_model.dart';

class TypeService extends StatefulWidget {
  const TypeService({super.key, required this.TypeServices, required this.onServiceSelected});
  final ServicesModel TypeServices;
  final Function(int) onServiceSelected;

  @override
  State<TypeService> createState() => _TypeServiceState();
}

class _TypeServiceState extends State<TypeService> {
  ServicesModel? selectedService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // تحديث قيمة isSelected عند الضغط على العنصر
        setState(() {
          selectedService = widget.TypeServices;
            // إذا تم اختيار الخدمة، قم بتحديث حالة جميع عناصر الخدمة لتكون غير محددة
            widget.onServiceSelected(widget.TypeServices.id);

        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),

        child: Container(
          height:50,
          width: 150,
          /////////////////////////////////////رابط صورة////////////////
          decoration:  BoxDecoration(
            color: selectedService == widget.TypeServices ? Colors.purpleAccent[100] : Colors.grey[300], // تغيير لون Container حسب العنصر المحدد

            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey, // تحديد لون الحدود بناءً على isSelected
              width: 2, // عرض الحافة
            ),
          ),
          child: Center(
            child: Text(widget.TypeServices.name!,
              style: TextStyle ( color: selectedService == widget.TypeServices ? Colors.white : Colors.purpleAccent, // تغيير لون Container حسب العنصر المحدد
                fontFamily: 'Angkor',
                  fontSize: 16,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}