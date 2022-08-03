import 'package:flutter/material.dart';
import 'package:nutrition_diary/app/ui/theme/app_colors.dart';

class CustomTextInput extends StatelessWidget {
  final String? label, value;
  final EdgeInsetsGeometry? margin, padding = const EdgeInsets.all(16);
  final Color? valueBackground;
  final TextEditingController? controller;
  const CustomTextInput({
    Key? key,
    required this.label,
    required this.value,
    required this.controller,
    this.margin,
    this.valueBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('$label:',
                style: const TextStyle(color: AppColors.primary, fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, left: 3, right: 3),
            width: MediaQuery.of(context).size.width * .6,
            // padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'inter',
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: valueBackground ?? AppColors.primaryExtraSoft,
              ),
              // initialValue: value,
            ),
          )
        ],
      ),
    );
  }
}
