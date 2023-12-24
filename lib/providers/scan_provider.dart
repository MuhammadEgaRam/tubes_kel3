import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubes_kel3/pages/scan.dart';

class ScanNotifier extends StateNotifier<File> {
  ScanNotifier() : super(File(''));

  void updateCapturedImage(File capturedImage) {
    state = capturedImage;
  }

  // File? get capturedImage => state;
}

final scanProvider = StateNotifierProvider<ScanNotifier, File?>((ref) {
  return ScanNotifier();
});