import 'package:flutter/material.dart';
import 'package:nutrition_diary/app/ui/theme/app_colors.dart';

class UserInfoTile extends StatelessWidget {
  final String? label, value;
  final EdgeInsetsGeometry? margin, padding;
  final Color? valueBackground;
  const UserInfoTile({
    Key? key,
    @required this.label,
    @required this.value,
    this.padding,
    this.margin,
    this.valueBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('$label',
                style: const TextStyle(color: AppColors.primary, fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: valueBackground ?? AppColors.primaryExtraSoft,
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(
              //   color: AppColors.primary,
              //   width: 1,
              // ),
            ),
            child: Text('$value',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
