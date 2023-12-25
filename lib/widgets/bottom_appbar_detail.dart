import 'package:flutter/material.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/routes/route.dart';

class BottomAppDetail extends StatelessWidget {
  final VoidCallback? onSave;
  final VoidCallback? onRetake;

  const BottomAppDetail({
    super.key,
    this.onSave,
    this.onRetake,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomAppBar(
        color: Color(0xff03a1fe),
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxHeight: 80.0), // Adjust the maxHeight as needed
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.camera_alt_outlined,
                          color: Colors.white, size: 27),
                      onPressed: () {
                        onRetake?.call();
                      },
                    ),
                    // Text(
                    //   'Camera',
                    //   style: SafeGoogleFont(
                    //     'urbanist',
                    //     fontWeight: FontWeight.w200,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                thickness: 1.0,
                indent: 8.0,
                endIndent: 8.0,
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: 80.0), // Adjust the maxHeight as needed
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.save_alt_outlined,
                          color: Colors.white, size: 26),
                      onPressed: () {
                        onSave?.call();
                      },
                    ),
                    // Text(
                    //   'Save',
                    //   style: SafeGoogleFont(
                    //     'urbanist',
                    //     fontWeight: FontWeight.w200,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}