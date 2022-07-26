import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeBoxwidth = size.width * 0.8;
    final sizeBoxheight = size.height * 0.20;

    final sizeBetweenTitleDescription = size.height * 0.05;

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
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: sizeBetweenTitleDescription),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(width: size.width * 0.05),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
