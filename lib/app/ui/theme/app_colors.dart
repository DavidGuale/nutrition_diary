import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF487F63);
  static const Color secondary = Color(0xFFF0B86C);
  static const Color tertiary = Color(0xFF1A2E39);
  static const Color quaternary = Color(0xFFFDF9F0);
  static const Color color5 = Color(0xFFA0A0A0);
  static Color color6 = Colors.amber.shade200;
  static const Color primarySoft = Color(0xFF0B5551);
  // static const Color primaryExtraSoft = Color(0xFFEEF4F4);
  static const Color primaryExtraSoft = Color.fromARGB(255, 212, 236, 236);
  static const Color whiteSoft = Color(0xFFF8F8F8);
  static LinearGradient bottomShadow = LinearGradient(colors: [
    const Color(0xFF107873).withOpacity(0.2),
    const Color(0xFF107873).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
