import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubes_kel3/models/item.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/widgets/bottom_appbar_detail.dart';
import 'package:tubes_kel3/providers/scan_provider.dart';
import 'package:tubes_kel3/data/ktm_database.dart';
import 'package:tubes_kel3/routes/route.dart';

class DetailKtm extends ConsumerStatefulWidget {
  final Item item;

  const DetailKtm({Key? key, required this.item}) : super(key: key);

  @override
  ConsumerState<DetailKtm> createState() => _DetailKtmState();
}

class _DetailKtmState extends ConsumerState<DetailKtm> {
  @override
  Widget build(BuildContext context) {
    final capturedFile = ref.watch(scanProvider);
    print('captured image: $capturedFile');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil Scan',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
        ),
        backgroundColor: Color(0xff03a1fe),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Tambahkan widget Positioned dan Align untuk gambar hasil scan
            Positioned(
              left: 0, // Ubah sesuai dengan kebutuhan Anda
              top: 100, // Ubah sesuai dengan kebutuhan Anda
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 360, // Ubah sesuai dengan kebutuhan Anda
                  height: 229, // Ubah sesuai dengan kebutuhan Anda
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    // child: Image.asset('assets/images/ktp7-1-7Hr.png'),
                    child: kIsWeb
                        ? Image.network(capturedFile!.path)
                        : Image.file(capturedFile!),
                  ),
                ),
              ),
            ),
            // Tambahkan Container di sini
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10.5),
              width: double.infinity,
              height: 0.5,
              decoration: const BoxDecoration(
                color: Color(0xff4a4a4a),
              ),
            ),
            // Tambahkan kolom untuk detail hasil scan
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Id',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                  ),
                ),
                  subtitle: Text(
                    widget.item.id as String,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),

                ListTile(
                  title: Text(
                    'NIM',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.nim,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Nama',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.nama,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Tempat, Tanggal Lahir',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.ttl,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Prodi',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.prodi,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Alamat',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.alamat,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Kecamatan',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.kec,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Kabupaten',
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4a4a4a),
                    ),
                  ),
                  subtitle: Text(
                    widget.item.kab,
                    style: SafeGoogleFont(
                      'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
// Tambahkan navigation bar di bagian bawah
      bottomNavigationBar: BottomAppDetail(
        onSave: () async {
          // if (item == null) return;

          final fileByte = await capturedFile.readAsBytes();

          KTMDatabase().save(widget.item, fileByte, fileByte);
          Navigator.pushReplacementNamed(context, Routes.riwayat);
        },
        onRetake: () {
          Navigator.popAndPushNamed(context, Routes.scan);
        },
      ),
    );
  }
}