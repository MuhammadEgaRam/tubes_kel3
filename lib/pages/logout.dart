import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubes_kel3/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        title: Text(
          'Konfirmasi Keluar',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a4a4a),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xff4a4a4a)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apakah anda yakin ingin keluar?',
              style: SafeGoogleFont(
                'Urbanist',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff4a4a4a),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                // Lakukan logout dari Firebase
                await FirebaseAuth.instance.signOut();

                // Navigasi ke halaman signIn
                Navigator.pushNamed(context, Routes.signIn);
              },
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(100, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              child: Text(
                'Iya',
                style: SafeGoogleFont(
                  'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}