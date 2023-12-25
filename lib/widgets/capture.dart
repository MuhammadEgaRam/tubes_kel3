import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';

class CekrikButtonBar extends StatelessWidget {
  final VoidCallback onPressed;

  const CekrikButtonBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Panggil fungsi onPressed yang diberikan
        onPressed();

        // Setelah capture, arahkan ke halaman SimpanKTPPage
        // Navigator.pushReplacementNamed(context, '/scan/detail');
      },
      child: Icon(Icons.camera_outlined),
    );
  }
}
