import 'package:flutter/material.dart';
import 'models.dart';

class detailItem extends StatefulWidget {
  const detailItem({Key? key}) : super(key: key);

  @override
  _detailItemState createState() => _detailItemState();
}

class _detailItemState extends State<detailItem> {
  Items? _item;

  int _counter = 0;

  var ModelRoute;

  void plustState() {
    setState(() {
      _counter++;
    });
  }

  void mintState() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModelRoute.of(context)!.settings.argument as Map<String, Object>;
    if (args.containsKey('item')) {
      var item = args['item'];
      if (item is Items) {
        _item = item;
        if (_counter < 0) {
          _counter = _item?.jumlah ?? 0;
        }
      }
    }

    var nama;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Keranjang'),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('img/${_items?.gambar}'),
                width: 350,
                height: 300,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _items?.nama?? 'EROR',
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _items?.harga?? 'EROR',
                      style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text(
                    _items?.deskripsi?? 'EROR',
                      style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: mintState,
                  icon: Icon(Icons.remove_circle_outline_rounded)),
              Text('$_counter',
                  style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              IconButton(
                  onPressed: plustState,
                  icon: Icon(Icons.add_circle_outline_rounded)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop({'jumlah': _counter});
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => detailItem()),
              // );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: Text('Konfirmasi',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}

class _items {
  static var nama;

  static var harga;

  static var deskripsi;

  static var gambar;
}
