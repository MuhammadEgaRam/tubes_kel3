import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tubes_kel3/models/item.dart';

class KTMDatabase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> save(Item item, Uint8List ktm, Uint8List wajah) async {
    final user = auth.currentUser;

    final ref = firestore.collection('users').doc(user!.uid).collection('ktms');

    final doc = await ref.doc();

    final storageRef = storage.ref('gambar_ktm').child(doc.id);

    final ktmRef = storageRef.child('ktm.jpg');
    final wajahRef = storageRef.child('wajah.jpg');

    await ktmRef.putData(ktm);
    await wajahRef.putData(wajah);

    await doc.set(item.toJson()
      ..addAll({
        'imageUrl': await ktmRef.getDownloadURL(),
        'wajahUrl': await wajahRef.getDownloadURL(),
      }));
  }

  Future<List<Item>> all() async {
    final user = auth.currentUser;

    final ref = firestore.collection('users').doc(user!.uid).collection('ktms');

    final snapshot = await ref.get();

    return snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList();
  }
}
