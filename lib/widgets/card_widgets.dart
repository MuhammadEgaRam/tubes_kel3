import 'package:flutter/material.dart';
import 'package:tubes_kel3/models/item.dart';
import 'package:tubes_kel3/data/data_detail.dart';
import 'package:tubes_kel3/utils.dart';
import 'package:tubes_kel3/pages/riwayatmodal.dart';

class CardWidget extends StatelessWidget {
  final List<Item> items;

  const CardWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Menampilkan 2 item per baris
          childAspectRatio: 3.7, // Mengatur rasio lebar-tinggi item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(item: item);
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Navigator.pushNamed(context, '/item', arguments: item);
      },
      splashColor: Colors.blue, // Warna ketika diarahkan
      highlightColor: Colors.blue, // Warna ketika diklik
      child: Card(
        color: Color.fromARGB(255, 62, 226, 255),
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Colors.black, // Specify the color of the border
            width: 0.25, // Specify the width of the border
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item.imageUrl,
              width: 64, // Sesuaikan ukuran yang diinginkan
              height: 64, // Sesuaikan ukuran yang diinginkan
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            item.nama,
            style: SafeGoogleFont(
              'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 2.9999999728,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                item.tanggalsc,
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(width: 20),
              Text(
                item.waktusc,
                style: SafeGoogleFont(
                  'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              _showDetailDialog(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/ep-arrow-up.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 297,
            height: 560,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                buildInfoRow('ID', '0'),
                buildInfoRow('NIM', '2141720143'),
                buildInfoRow('Nama', 'Muhammad Ega Rama Fernanda'),
                buildInfoRow('Tempat/Tgl Lahir', 'Malang, 12-07-2002'),
                buildInfoRow('Prodi', 'D-IV T. Informatika'),
                buildInfoRow('Alamat', 'JL. Mawar NO.39'),
                buildInfoRow('Kecamatan', '1/3 Penataban Giri'),
                buildInfoRow('Kabupaten', 'Banyuwangi'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
  // Rest of the code...
}
