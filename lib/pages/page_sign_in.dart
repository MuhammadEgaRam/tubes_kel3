import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:tubes_kel3/widgets/custom_field_text.dart';
import 'package:tubes_kel3/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tubes_kel3/pages/page_sign_up.dart';
import 'package:tubes_kel3/pages/onboard_screen.dart';
import 'package:tubes_kel3/global/common/toast.dart';
import 'package:tubes_kel3/pages/user_auth/firebase_auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class pageSignIn extends StatefulWidget {
  const pageSignIn({super.key});

  @override
  State<pageSignIn> createState() => _pageSignIn();
}

class _pageSignIn extends State<pageSignIn> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.OnboardingContent);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 100,
                height: 100,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Hi 👋,'),
                ],
              ),
            ),
            SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Selamat Datang di '),
                  TextSpan(
                    text: 'SmartCard',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Masuk Ke Akun Kamu, Yuk!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Pastikan email dan password kamu benar, ya.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    labelText: 'Email',
                    controller: _emailController,
                    hintText: 'Masukkan Email',
                    inputType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    hintText: 'Masukkan Password',
                    isPasswordField: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                _signIn();
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
                width: 300,
                height: 50,
                child: _isSigning
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Center(
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kamu belum memiliki akun?"),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pageSignUp(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "\t\t\t\t\t\t\t\t\t\t\tSelamat, \nKamu berhasil masuk akun kamu!");
      Navigator.pushNamed(context, "/riwayat");
    } else {
      showToast(message: "\t\t\t\t\t\t\tUps, ada yang salah. \nPeriksa lagi email atau password kamu.");
    }
  }
}