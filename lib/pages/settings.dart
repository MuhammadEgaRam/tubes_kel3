import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_kel3/widgets/bottom_appbar.dart';
import 'package:tubes_kel3/widgets/floating_button_appbar.dart';
import '../widgets/custom_text_style.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pengaturan',
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
      body: buildSettingsList(),
      bottomNavigationBar: BottomApp(),
      floatingActionButton:
          FloatingButtonBar(), // Tambahkan FloatingButtonBar di sini
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Tempatkan FloatingButton di tengah
    );
  }

  Widget buildSettingsList() {
  User? user = FirebaseAuth.instance.currentUser; // Move the declaration here

  return ListView(
    padding: EdgeInsets.all(10),
    children: [
      // Tentang Kami
      Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Image(
              image: AssetImage('assets/images/girl_icon-icons.com_55043.png'),
              width: 70, // Set the width to the desired value
              height: 70, // Set the height to the desired value
            ),

            SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user != null ? user.displayName ?? '' : '',
                        style: SafeGoogleFont(
                        'Urbanist',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                    ],
                  ),
                 TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/logout');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      'Logout',
                      style: SafeGoogleFont(
                        'Urbanist',
                        color: Colors.red,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                ],
              ),
            ),
          ],
        ),
      ),
    SizedBox(width: 100),
      // Profil
    buildSettingItem(
      'Akun Saya',
      Icons.account_circle_rounded, // Ganti dengan ikon yang diinginkan
      '/profile',
      iconColor: Colors.blue, // Ganti dengan warna yang diinginkan
      textStyle: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Urbanist',
        // fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
       iconSize: 30.0, // Ukuran ikon sebagai parameter
    ),

    // Tentang Kami
    buildSettingItem(
      'Tentang Kami',
      Icons.favorite,
      '/about_us',
      iconColor: Colors.blue,
      textStyle: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Urbanist',
        // fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      iconSize: 30.0, // Ukuran ikon sebagai parameter
    )



     ],
  );
}


Widget buildSettingItem(
  String title,
  IconData iconData,
  String route, {
  required TextStyle textStyle,
  Color? iconColor,
  double? iconSize, // Tambahkan parameter iconSize
}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 4.0),
    leading: Padding(
      padding: const EdgeInsets.only(left: 30, right: 10),
      child: Icon(
        iconData,
        size: iconSize ?? 20.0, // Gunakan nilai default atau dari parameter
        color: iconColor,
      ),
    ),

    title: Text(
      title,
      style: SafeGoogleFont(
        'Urbanist',
        fontSize: 18.0,
        // fontWeight: FontWeight.bold,
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, route);
    },
  );
}

}