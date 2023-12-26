import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_kel3/utils.dart';

class ModalRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    // Membuat widget reusable untuk baris informasi
    Widget buildInfoRow(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8 * fem),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w600,
                color: Color(0xff4a4a4a),
              ),
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w600,
              color: Color(0xff808080),
            ),
          ),
        ],
      );
    }

    // Membuat widget reusable untuk baris informasi dengan SizedBox
    Widget buildInfoRowWithSizedBox(String label, String value) {
      return Column(
        children: [
          buildInfoRow(label, value),
          SizedBox(
            height: 8 * fem,
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 800 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 1 * fem,
              top: 712 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 73 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff03a1fe),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41 * fem,
              top: 670 * fem,
              child: Container(
                width: 277 * fem,
                height: 70 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ... Tambahkan elemen-elemen menu di sini
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0 * fem,
              top: 0 * fem,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.5 * fem,
                    sigmaY: 1.5 * fem,
                  ),
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 810 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32 * fem,
              top: 100 * fem,
              child: Align(
                child: SizedBox(
                  width: 297 * fem,
                  height: 560 * fem,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8 * fem),
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildInfoRowWithSizedBox('', ''),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 *
                                    fem), // Tambahkan margin bawah dan margin kanan
                            child: buildInfoRowWithSizedBox(
                                'NIM', '2141720143'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child:
                                buildInfoRowWithSizedBox('Nama', 'Muhammad Ega Rama Fernanda'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child: buildInfoRowWithSizedBox(
                                'Tempat/Tgl Lahir', 'Malang, 12-07-2002'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child: buildInfoRowWithSizedBox(
                                'Prodi', 'D-IV T. Informatika'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child: buildInfoRow(
                                'Alamat', 'JL. Mawar NO.39 RT/RW 001/003 Penataban Kec. Giri'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child: buildInfoRow(
                                'Kecamatan', 'RT/RW 001/003 Penataban Giri'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8 * fem), // Tambahkan margin bawah
                            child: buildInfoRowWithSizedBox(
                                'Kabupaten', 'Banyuwangi'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}