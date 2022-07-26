import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

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
            Icon(
              Icons.error,
              size: sizeIcon,
              color: Colors.red,
            ),
            Text('Error',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: sizeBetweenTitleDescription),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: sizeBetweenDescriptionButton),
            SizedBox(
              width: sizeBottomwidth,
              height: sizeBottomheight,
              child: CustomButton(
                icon: null,
                label: 'Aceptar',
                onTap: () => Navigator.pop(context),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
