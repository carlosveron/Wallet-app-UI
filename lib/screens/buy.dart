import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Map<String, String> buyitems = {
  'Pagar Conta': 'assets/images/qr-code.png',
  'Recarregar Celular': 'assets/images/credito.png',
  'Google Play': 'assets/images/google-play.png',
  'Spotify': 'assets/images/spotify.png',
  'Netflix': 'assets/images/netflix.png',
  'Uber': 'assets/images/uber.png',
};

class BuyScreen extends StatefulWidget {
  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {

    final list = ListView.builder(
        itemCount: buyitems.length,
     
        itemBuilder: (_, index) {
          var keys = buyitems.keys.toList();
          var val = buyitems.values.toList();
          return ListTile(
            title: Text(
              keys[index],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading:Image.asset('${val[index].toString()}'),
            subtitle: Text('This is a subtitle'),
             // Image.asset('${val[index].toString()}'),
            
            onTap: () {},
          );
        });

    final carousel = CarouselSlider(
      height: 150.0,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.black87),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Destaques",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            carousel,
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Serviços",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Text(
                    "Ver todos > ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
            ),
           
            Expanded(
              child: list,
            )
          ],
        ),
      ),
    );
  }
}
