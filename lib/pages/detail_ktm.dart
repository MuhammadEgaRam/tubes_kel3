import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubes_kel3/models/item.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/widgets/bottom_appbar_detail.dart';
import 'package:tubes_kel3/providers/scan_provider.dart';
import 'package:tubes_kel3/data/ktm_database.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DetailKtm extends ConsumerStatefulWidget {
  final Item item;

  const DetailKtm({Key? key, required this.item}) : super(key: key);

  @override
  ConsumerState<DetailKtm> createState() => _DetailKtmState();
}

class _DetailKtmState extends ConsumerState<DetailKtm> {
  File? _image;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    final capturedFile = ref.watch(scanProvider);
    print('captured image: $capturedFile');

    Future<void> _uploadImage() async {
      if (_image == null) {
        return Future.value();
      }

      String apiUrl = "http://192.168.209.85:5000/result";
      var uri = Uri.parse(apiUrl);

      var request = http.MultipartRequest("POST", uri);
      request.files
          .add(await http.MultipartFile.fromPath('file', _image!.path));

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          var responseBody = await response.stream.bytesToString();
          var result = json.decode(responseBody);

          setState(() {
            _result = jsonEncode(result);
          });

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Hasil OCR"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildField("NIM", result['nim']),
                      buildField("Nama", result['nama']),
                      buildField("Tempat/Tgl Lahir", result['tempatTglLahir']),
                      buildField("Prodi", result['prodi']),
                      buildField("Alamat", result['alamat']),
                      buildField("Kecamatan", result['kec']),
                      buildField("Kabupaten", result['kab']),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          print("Error: ${response.reasonPhrase}");
        }
      } catch (error) {
        print("Error: $error");
      }

      return Future.value();
    }

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

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
