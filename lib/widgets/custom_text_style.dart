import 'package:flutter/material.dart';
import 'package:tubes_kel3/utils.dart';

class CustomTextStyle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  CustomTextStyle({
    required this.text,
    this.fontSize = 20,
    this.color = const Color(0xff4a4a4a),
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: SafeGoogleFont(
        'Urbanist',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight, // Tambahkan font weight di sini
      ),
    );
  }
}
