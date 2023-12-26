import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Akun Saya',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a4a4a),
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff4a4a4a)),
      ),
      body: Center(
        child: Column(
          children: [
            // Profil picture
            SizedBox(height:60, width: 100),
            Image(
              image: AssetImage('assets/images/healthicons-ui-user-profile-4iL.png'),
              width: 100, 
              height: 100,
            ),
            SizedBox(height: 30),
            // Profil name
            Container(
              padding: EdgeInsets.only(top: 35, bottom: 8, left: 40),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nama Lengkap',
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4a4a4a),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              margin: EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CustomTextStyle(
                text: user != null ? user.displayName ?? '' : '',
                fontSize: 18,
              ),
            ),


            // Alamat email
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 8, left: 40),
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4a4a4a),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              margin: EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400, // Warna abu
                  width: 1.0, // Lebar border
                ),
                borderRadius: BorderRadius.circular(8.0), // Radius border
              ),
               child: CustomTextStyle(
                text: user != null ? user.email ?? '' : '',
                fontSize: 18, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}