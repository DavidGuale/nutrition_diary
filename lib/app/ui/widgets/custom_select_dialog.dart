import 'package:flutter/material.dart';

class CustomSelectDialog extends StatelessWidget {
  const CustomSelectDialog({
    Key? key,
    required this.options,
    required this.title,
  }) : super(key: key);

  final Widget options;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeBoxwidth = size.width * 0.8;
    final sizeBoxheight = size.height * 0.45;
    final sizeBetweenTitleDescription = size.height * 0.01;
    final sizeTop = size.height * 0.02;

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
            SizedBox(
              height: sizeTop,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: sizeBetweenTitleDescription),
            Expanded(child: options),
          ],
        ),
      ),
    );
  }
}
