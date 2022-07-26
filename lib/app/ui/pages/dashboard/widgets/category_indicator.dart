// import 'package:flutter/material.dart';

// import '../../../theme/app_colors.dart';

// class CategoryIndicator extends StatelessWidget {
//   const CategoryIndicator({
//     Key? key,
//     required this.onTap,
//     required this.title,
//   }) : super(key: key);

//   final VoidCallback onTap;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final widthButton = size.width / 2 - 35;
//     final heightButton = size.width / 2 - 35;
//     const borderRadius = 8.0;

//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: widthButton,
//         width: heightButton,
//         decoration: BoxDecoration(
//             color: AppColors.whiteSoft,
//             borderRadius: BorderRadius.circular(borderRadius),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromARGB(20, 0, 0, 0),
//                 offset: Offset(1, 1),
//                 blurRadius: 2,
//                 spreadRadius: 1.0,
//               ),
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               width: 40,
//               height: 40,
//               child: Icon(
//                 Icons.food_bank_outlined,
//                 size: 40,
//                 color: AppColors.primary,
//               ),
//             ),
//             Container(
//               height: heightButton / 4,
//               width: widthButton,
//               alignment: Alignment.topLeft,
//               decoration: const BoxDecoration(),
//               child: Text(
//                 title,
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
