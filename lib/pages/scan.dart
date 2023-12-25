import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_kel3/main.dart';
import 'package:tubes_kel3/providers/scan_provider.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:tubes_kel3/widgets/bottom_appbar.dart';
import 'package:tubes_kel3/widgets/capture.dart';

class ScanState extends ConsumerStatefulWidget {
  @override
  ConsumerState<ScanState> createState() => _ScanState();
}

class _ScanState extends ConsumerState<ScanState> with WidgetsBindingObserver {
  File? capturedImage;

  CameraController? controller;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeAndDisplayCamera();
    }
  }

  Future<void> initializeAndDisplayCamera() async {
    try {
      controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );

      // Menginisialisasi controller dan menunggu inisialisasi selesai
      await controller!.initialize();

      setState(() {});

      // setState(() {});
    } catch (e) {
      print("Kesalahan saat mengakses kamera: $e");
      // Lakukan tindakan yang sesuai jika terjadi kesalahan
      rethrow;
    }
  }

  void onTakePicture() async {
    try {
      if (controller != null && controller!.value.isInitialized) {
        XFile xFile = await controller!.takePicture();
        final notifier = ref.read(scanProvider.notifier);
        capturedImage = File(xFile.path);

        notifier.updateCapturedImage(capturedImage!);

        print('sukses: $capturedImage');
        Navigator.pushNamed(context, Routes.detail_scan,
            arguments: capturedImage);

        sendFileToApi(capturedImage!);

        setState(() {});
      }
    } catch (e) {
      print("Kesalahan saat mengambil gambar: $e");
      // Lakukan tindakan yang sesuai jika terjadi kesalahan
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeAndDisplayCamera();
    });
  }

  @override
  void dispose() {
    print("scan: disposed");
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Scan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Color(0xff03a1fe),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: CekrikButtonBar(
          onPressed: () {
            onTakePicture();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomApp(),
        body: Stack(
          children: [
            Positioned.fill(
              child: controller?.value.isInitialized == true
                  ? CameraPreview(controller!)
                  : Center(child: CircularProgressIndicator()),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: AspectRatio(
                          aspectRatio: (1.56 / 1),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendFileToApi(File filePath) async {
    final apiUrl = "https://c4dc-114-6-31-174.ngrok.io/upload";

    final uri = Uri.parse(apiUrl);

    var request = http.MultipartRequest("POST", uri);

    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        filePath.readAsBytes().asStream(),
        filePath.lengthSync(),
        filename: filePath.path,
      ),
    );
    request.headers.addAll(headers);

    try {
      // Send the request
      final response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }
}