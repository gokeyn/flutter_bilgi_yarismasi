import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    'Titanic gelmiş geçmiş en büyük gemidir',
    'Dünyadaki tavuk sayısı insan sayısından fazladır',
    'Kelebeklerin ömrü bir gündür',
    'Dünya düzdür',
    'Kaju fıstığı aslında bir meyvenin sapıdır',
    'Fatih Sultan Mehmet hiç patates yememiştir',
    'Fransızlar 80 demek için, 4 - 20 der'
  ];
  List<bool> yanitlar = [false, true, false, false, true, true, true];

  Soru soru_1 = Soru(
      soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false);

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.end,
          runSpacing: 3,
          spacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            bool dogruYanit = yanitlar[soruIndex];
                            setState(() {
                              dogruYanit == false
                                  ? secimler.add(kDogruIconu)
                                  : secimler.add(kYanlisIconu);
                              soruIndex++;
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            bool dogruYanit = yanitlar[soruIndex];
                            setState(() {
                              dogruYanit == false
                                  ? secimler.add(kYanlisIconu)
                                  : secimler.add(kDogruIconu);
                              soruIndex++;
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

class Soru {
  String? soruMetni;
  bool? soruYaniti;

  Soru({@required this.soruMetni, this.soruYaniti});
}
