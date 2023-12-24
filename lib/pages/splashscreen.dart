import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/routes/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Menunggu selama 5 detik dan kemudian melakukan navigasi ke halaman "Sign In"
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, Routes.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Ganti warna latar belakang sesuai kebutuhan
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, Routes.signIn); // Navigasi ke halaman sign-in
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',
                  width: 170, height: 170), // Ganti dengan path logo Anda
              SizedBox(height: 16),
              Text(
                'Testing',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4a4a4a), // Ganti warna teks sesuai kebutuhan
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}