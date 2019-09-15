import 'package:flutter/material.dart';
import 'package:payme/helper/SendDialog.dart';
import 'package:payme/screens/search.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(34, 58, 90, 0.2),
  100: Color.fromRGBO(34, 58, 90, 0.3),
  200: Color.fromRGBO(34, 58, 90, 0.4),
  300: Color.fromRGBO(34, 58, 90, 0.5),
  400: Color.fromRGBO(34, 58, 90, 0.6),
  500: Color.fromRGBO(34, 58, 90, 0.7),
  600: Color.fromRGBO(34, 58, 90, 0.8),
  700: Color.fromRGBO(34, 58, 90, 0.9),
  800: Color.fromRGBO(34, 58, 90, 1.0),
  900: Color.fromRGBO(34, 58, 90, 1.1),
};
MaterialColor colorCustom = MaterialColor(0xFF223A5A, color);

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  var pessoas = [
    'Carlos',
    'Ana',
    'Vanessa',
    'Ramona',
    'Frakys ney',
    'Amanda',
    'Zézinho'
  ];

  var _textColor = Color.fromRGBO(253, 211, 4, 1);

  @override
  Widget build(BuildContext context) {
    final list = ListView.separated(
        itemCount: pessoas.length,
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              '${pessoas[index]}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://static.india.com/wp-content/uploads/2016/07/Emma-Watson.jpg'),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SendDialog(
                  reciver: '${pessoas[index]}',
                  title: 'Enviar para ${pessoas[index]}',
                  buttonText: "Enviar",
                ),
              );
            },
          );
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: colorCustom,
            child: Center(
              child: Text(
                'R\$ 800,00',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: list,
          )
        ],
      )),
    );
  }
}
