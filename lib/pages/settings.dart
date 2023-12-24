import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/widgets/bottom_appbar.dart';
import 'package:tubes_kel3/widgets/floating_button_appbar.dart';

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
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        buildSettingItem('Tentang Kami',
            'assets/images/mdi-about-circle-outline.png', '/about_us'),
        buildSettingItem('Profile',
            'assets/images/healthicons-ui-user-profile-4iL.png', '/profile'),
        buildSettingItem(
            'Keluar', 'assets/images/humbleicons-logout.png', '/logout'),
      ],
    );
  }

  Widget buildSettingItem(String title, String iconAsset, String route) {
    return ListTile(
      leading: Image.asset(
        iconAsset,
        width: 20,
        height: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Urbanist',
          color: Color(0xff4a4a4a),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}