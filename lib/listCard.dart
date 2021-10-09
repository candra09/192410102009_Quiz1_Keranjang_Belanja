import 'package:flutter/material.dart';
import 'models.dart';

class CardItem extends StatelessWidget {
  final Items item;
  CardItem(this.item);

  // void _handleNavRecult(Object? result, Items item){
  //   if (result != null){
  //     var resultMap = result as Map<String, Object>;
  //     if (resultMap.containsKey('jumlah')){
  //         var jumlah = resultMap['jumlah'];
  //         if(jumlah is int){
  //           int _jumlah = jumlah;
  //           var index = _listItem.indexOf(item);

  //         }
  //     }
  //   }
  // }
  // @override
  // void main(List<String> args) {
  // var selector = BooleanSelector.parse('item');}

  Widget build(BuildContext context) {
    return
        // Container(
        //   child: Column(
        //     children: _listItem.map((item){

        //     }
        //   ),
        // ),
        Card(
      margin: EdgeInsets.all(10),
      color: Colors.green[200],
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'img/${item.gambar}',
                width: 120,
                height: 130,
              )),
          Container(
            height: 130,
            width: 200,
            // color: Colors.yellow,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.nama,
                  style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text("harga: Rp. " + item.harga.toString(),
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                Text("Jumlah: " + item.jumlah.toString(),
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    color: Colors.green,
                    child: Text(
                      'Lihat Detail',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
  //
}
