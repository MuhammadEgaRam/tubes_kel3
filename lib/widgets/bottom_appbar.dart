import 'package:flutter/material.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/pages/settings.dart';
import 'package:tubes_kel3/routes/route.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff03a1fe),
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon:
                    Icon(Icons.history_outlined, color: Colors.white, size: 27),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.riwayat);
                },
              ),
              Text(
                'Riwayat',
                style: SafeGoogleFont(
                  'urbanist',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white, size: 26),
                onPressed: () {
                  // Navigasi ke halaman settings.dart saat tombol "Pengaturan" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Settings()), // Sesuaikan dengan nama halaman settings.dart
                  );
                },
              ),
              Text(
                'Pengaturan',
                style: SafeGoogleFont(
                  'urbanist',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}