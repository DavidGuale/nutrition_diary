import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const widthSpacing = 20.0;
    return InkWell(
      // borderRadius: BorderRadius.circular(10),
      highlightColor: Colors.black54,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: (color != null) ? color : AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: (icon != null)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    const SizedBox(width: widthSpacing),
                    Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                )
              : Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
