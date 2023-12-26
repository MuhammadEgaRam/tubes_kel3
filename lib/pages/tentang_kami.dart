import 'package:flutter/material.dart';
import 'package:tubes_kel3/utils.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff4a4a4a),
          onPressed: () {
            Navigator.of(context).pop(); // Untuk kembali ke layar sebelumnya
          },
        ),
        title: Text(
          'Tentang Kami',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a4a4a),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 33.17), // Menambahkan jarak atas
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Pengguna Pertama
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                ), // Menambahkan jarak antara pengguna
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 27.08, 0),
                        width: 50.83,
                        height: 50.83,
                        child: Icon(
                          Icons.person,
                          size: 50.83,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Bryan Tosin Saputra',
                        style: SafeGoogleFont(
                          'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Pengguna Kedua
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                ), // Menambahkan jarak antara pengguna
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 27.08, 0),
                        width: 50.83,
                        height: 50.83,
                        child: Icon(
                          Icons.person,
                          size: 50.83,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Maria Fadilla',
                        style: SafeGoogleFont(
                          'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                ), // Menambahkan jarak antara pengguna
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 27.08, 0),
                        width: 50.83,
                        height: 50.83,
                        child: Icon(
                          Icons.person,
                          size: 50.83,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Mirabell Joice Laura',
                        style: SafeGoogleFont(
                          'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                ), // Menambahkan jarak antara pengguna
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 27.08, 0),
                        width: 50.83,
                        height: 50.83,
                        child: Icon(
                          Icons.person,
                          size: 50.83,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Muhammad Ega Rama Fernanda',
                        style: SafeGoogleFont(
                          'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                ), // Menambahkan jarak antara pengguna
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 27.08, 0),
                        width: 50.83,
                        height: 50.83,
                        child: Icon(
                          Icons.person,
                          size: 50.83,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Mukhamad Faruq Al Fahmi',
                        style: SafeGoogleFont(
                          'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: Text(
                  'SmartCard',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Urbanist',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff03a1fe),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'Aplikasi ini kami buat untuk memenuhi tugas Ujian Tengah Semester',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}