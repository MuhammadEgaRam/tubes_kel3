import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubes_kel3/widgets/custom_text_style.dart';

import '../routes/route.dart';
import '../utils.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
              'assets/images/iconly-regular-outline-arrow-left.png'),
          onPressed: () {
            Navigator.pushNamed(context, Routes.setting);
          },
        ),
        title: Text(
          'Konfirmasi Keluar',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a4a4a),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextStyle(
                text: 'Apakah Anda yakin ingin keluar?',
                fontSize: 18,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signIn);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              child: CustomTextStyle(
                  text: 'Iya', color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}