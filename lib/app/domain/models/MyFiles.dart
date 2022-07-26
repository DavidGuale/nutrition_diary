import 'package:flutter/material.dart';
import 'package:nutrition_diary/app/ui/pages/home/home_page.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final double? numOfFiles;
  final int? percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Calorias",
    numOfFiles: homeProvider.read.caloriesConsumed,
    svgSrc: "assets/icons/calories.svg",
    totalStorage: "1.9GB",
    color: Color(0xffFC67A7),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Carbohidratos",
    numOfFiles: 1328,
    svgSrc: "assets/icons/carbohydrates.svg",
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Proteinas",
    numOfFiles: 1328,
    svgSrc: "assets/icons/proteins.svg",
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Grasas",
    numOfFiles: 5328,
    svgSrc: "assets/icons/fat.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF2697FF),
    percentage: 100,
  ),
];
