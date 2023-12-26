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
        body: Form(
          child: Center(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 100,
                    height: 100,
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: CustomTextStyle(
                  text: 'Selamat Datang di Testing',
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
              Container(
                child: CustomTextStyle(text: 'Buat akun Testing anda.'),
              ),
              CustomTextField(
                controller: _usernameController,
                hintText: 'username',
                isPasswordField: false,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Masukkan Email',
                isPasswordField: false,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Masukkan Password',
                isPasswordField: true,
              ),
              CustomTextField(
                labelText: 'Ulangi Password',
                hintText: 'Masukkan Ulang Password',
                isPasswordField: true,
              ),
              GestureDetector(
                onTap: () {
                  _signUp();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue, // Menambahkan warna latar belakang
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
                              color: Colors.white, // Menambahkan warna teks
                            ),
                          ),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageSignIn()),
                            (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ]),
          ),
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

    try {
      // Membuat akun dengan email dan password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mendapatkan objek User dari hasil pembuatan akun
      User? user = userCredential.user;

      // Memperbarui profil pengguna dengan menambahkan informasi username
      await user?.updateProfile(displayName: username);

      setState(() {
        isSigningUp = false;
      });

      if (user != null) {
        showToast(message: "User is successfully created");
        Navigator.pushNamed(context, "/riwayat");
      } else {
        showToast(message: "Some error happened");
      }
    } catch (e) {
      print('Error during sign up: $e');
      showToast(message: "Some error happened");
      setState(() {
        isSigningUp = false;
      });
    }
  }
}
