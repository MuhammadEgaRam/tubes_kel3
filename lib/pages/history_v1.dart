import 'package:flutter/material.dart';
import 'package:tubes_kel3/models/item.dart';
import 'package:tubes_kel3/data/data_detail.dart';
import 'package:tubes_kel3/utils.dart';
// import 'package:tubes_kel3/widgets/bottom_appbar_detail.dart';
import 'package:tubes_kel3/widgets/bottom_appbar.dart';
import 'package:tubes_kel3/widgets/floating_button_appbar.dart';
import 'package:tubes_kel3/widgets/card_widgets.dart';
import 'package:tubes_kel3/routes/route.dart';

class HistoryV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Riwayat',
          style: SafeGoogleFont(
            'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a4a4a),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: CardWidget(items: InitialData.items),
      floatingActionButton:
          FloatingButtonBar(), // ini untuk memanggil widget floating_button_appbar
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // ini juga
      bottomNavigationBar:
          BottomApp(), // ini untuk memanggil widget bottom_appbar
    );
  }
}