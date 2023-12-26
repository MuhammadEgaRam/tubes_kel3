import 'package:tubes_kel3/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:tubes_kel3/widgets/custom_field_text.dart';
import 'package:tubes_kel3/widgets/custom_text_style.dart';
import 'package:tubes_kel3/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_kel3/pages/user_auth/firebase_auth_service.dart';
import 'package:tubes_kel3/pages/page_sign_in.dart';

class pageSignUp extends StatefulWidget {
  const pageSignUp({super.key});

  @override
  _pageSignUpState createState() => _pageSignUpState();
}

class _pageSignUpState extends State<pageSignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    RichText(
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
                      'Buat Akun SmartCard Kamu, Yuk!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Lengkapi formulir di bawah ini dengan benar, ya.',
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
                            'Nama Lengkap',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                            labelText: 'Nama Lengkap',
                            controller: _usernameController,
                            hintText: 'Masukkan nama lengkap Kamu',
                            isPasswordField: false,
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
                            hintText: 'useremail@gmail.com',
                            isPasswordField: false,
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
                            hintText: 'Minimal 8 karakter',
                            isPasswordField: true,
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
                            'Konfirmasi Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                            labelText: 'Konfirmasi Password',
                            hintText: 'Masukkan ulang password',
                            isPasswordField: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        _signUp();
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
                        child: isSigningUp
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'Daftar',
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
                        Text("Kamu sudah memiliki akun?"),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pageSignIn(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      showToast(message: "\t\t\t\t\t\t\t\tSelamat, \nKamu telah berhasil mendaftar!");
      Navigator.pushNamed(context, "/riwayat");
    } else {
      showToast(message: "\t\tUps, ada yang salah. \nPeriksa lagi data kamu, ya.");
    }
  }
}