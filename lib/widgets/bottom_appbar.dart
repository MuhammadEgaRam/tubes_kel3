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
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.history_outlined,
                        color: Colors.white, size: 27),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.riwayat);
                    },
                  ),
                ),
                Text(
                  'Riwayat',
                  style: SafeGoogleFont(
                    'urbanist',
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.settings, color: Colors.white, size: 26),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Pengaturan',
                  style: SafeGoogleFont(
                    'urbanist',
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}