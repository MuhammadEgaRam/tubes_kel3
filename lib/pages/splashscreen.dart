import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (FirebaseAuth.instance.currentUser != null) {
        // Jika pengguna sudah login, navigasi langsung ke halaman riwayat
        Navigator.pushReplacementNamed(context, Routes.riwayat);
      } else {
        // Jika pengguna belum login, tunggu selama 5 detik
        // dan navigasi ke halaman OnboardingContent
        Future.delayed(Duration(seconds: 5), () {
          // Cek apakah tampilan OnboardingScreen sudah pernah ditampilkan
          if (Navigator.canPop(context)) {
            // Jika sudah pernah ditampilkan, langsung keluar aplikasi
            Navigator.pop(context);
          } else {
            // Jika belum pernah ditampilkan, navigasi ke halaman OnboardingContent
            Navigator.pushReplacementNamed(context, Routes.OnboardingContent);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Ganti warna latar belakang sesuai kebutuhan
      body: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(
          //     context, Routes.OnboardingContent); // Navigasi ke halaman sign-in
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',
                  width: 170, height: 170), // Ganti dengan path logo Anda
              SizedBox(height: 16),
              Text(
                'SmartCard',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color(
                      0xff4a4a4a), // Ganti warna teks sesuai kebutuhan
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}