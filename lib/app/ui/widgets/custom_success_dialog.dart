import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({
    Key? key,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeBoxwidth = size.width * 0.8;
    final sizeBoxheight = size.height * 0.45;

    final sizeBottomwidth = size.width * 0.7;
    final sizeBottomheight = size.height * 0.07;

    final sizeIcon = size.height * 0.2;
    final sizeBetweenTitleDescription = size.height * 0.01;
    final sizeBetweenDescriptionButton = size.height * 0.06;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: sizeBoxwidth,
        height: sizeBoxheight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: sizeBoxwidth * .07),
            Icon(
              Icons.check_circle,
              size: sizeIcon,
              color: Colors.green,
            ),
            // Text('',
            //     style: Theme.of(context)
            //         .textTheme
            //         .headline5!
            //         .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: sizeBetweenTitleDescription),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
            ),
            SizedBox(height: sizeBetweenDescriptionButton),
            SizedBox(
              width: sizeBottomwidth,
              height: sizeBottomheight,
              child: CustomButton(
                icon: null,
                label: 'Aceptar',
                onTap: onTap,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
