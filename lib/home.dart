import 'package:flutter/material.dart';
import 'package:flutter_application_quiz1_8/listCard.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _listItem = [
    Items(
        id: 1,
        nama: 'Baso Aci',
        harga: 5000,
        jumlah: 2,
        gambar: 'aci.jpg',
        deskripsi: 'xxxx'),
    Items(
        id: 2,
        nama: 'Buku',
        harga: 5000,
        jumlah: 2,
        gambar: 'buku.jpg',
        deskripsi: 'xxxx'),
    Items(
        id: 3,
        nama: 'Kemeja',
        harga: 5000,
        jumlah: 2,
        gambar: 'kemeja.jpg',
        deskripsi: 'xxxx'),
  ];

  Object? result;

  // final Items item;
  // (this.item);
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var i = 0; i < _listItem.length; i++) {
      total += _listItem[i].harga * _listItem[i].jumlah;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Keranjang Belanja'),
          backgroundColor: Colors.greenAccent[400],
        ),
        bottomNavigationBar: Container(
            height: 50,
            color: Colors.greenAccent[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total',
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Rp. $total ',
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            )),
        body: ListView(
          children: _listItem
              .map((item) => InkWell(
                    onTap: () async {
                      var result = await Navigator.of(context)
                          .pushNamed('/detail', arguments: {
                        // 'item'= item
                      });
                      _handleNavResult(result, item);
                    },
                    child: CardItem(Items(
                        id: item.id,
                        nama: item.nama,
                        harga: item.harga,
                        jumlah: item.jumlah,
                        gambar: item.gambar,
                        deskripsi: item.deskripsi)),
                  ))
              .toList(),
        ));
  }

  void _handleNavResult(Object? result, Items item) {
    if (result != null) {
      var resultMap = result as Map<String, Object>;
      if (resultMap.containsKey('jumlah')) {
        var jumlah = resultMap['jumlah'];
        if (jumlah is int) {
          int _jumlah = jumlah;
          var index = _listItem.indexOf(item);
          if (index >= 0) {
            setState(() {
              _listItem[index] = Items(
                id: item.id,
                nama: item.nama,
                harga: item.harga,
                jumlah: item.jumlah,
                deskripsi: item.deskripsi,
                gambar: item.gambar,
              );
            });
          }
        }
      }
    }
  }
}