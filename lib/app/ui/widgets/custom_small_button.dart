import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
