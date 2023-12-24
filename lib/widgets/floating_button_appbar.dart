import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';

class FloatingButtonBar extends StatelessWidget {
  const FloatingButtonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton( 
      onPressed: () {
        Navigator.pushNamed(context, Routes.scan);
      },
      child: Icon(Icons.camera_alt_outlined),
    );
  }
}