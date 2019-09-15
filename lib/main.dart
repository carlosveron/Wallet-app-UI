import 'package:flutter/material.dart';
import 'package:payme/screens/buy.dart';
import 'package:payme/screens/send.dart';
import 'package:payme/screens/transaction.dart';

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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carteira',
      theme: ThemeData(primarySwatch: colorCustom),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color _iconColor = Colors.white;
  Color _textColor = Color.fromRGBO(253, 211, 4, 1);
  Color _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
 
  var logoImage = 'assets/images/piggy-bank.png';

  List<Color> _backgroundColor = [
    Color.fromRGBO(249, 249, 249, 1),
    Color.fromRGBO(241, 241, 241, 1),
    Color.fromRGBO(233, 233, 233, 1),
    Color.fromRGBO(222, 222, 222, 1),
  ];

  List<Color> _actionContainerColor = [
    Color.fromRGBO(47, 75, 110, 1),
    Color.fromRGBO(43, 71, 105, 1),
    Color.fromRGBO(39, 64, 97, 1),
    Color.fromRGBO(34, 58, 90, 1),
  ];

  

  void navegateToSend() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SendScreen()));
  }

  void navegateToBuy() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BuyScreen()));
  }

  void navegateToTransaction() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionScreen()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.3, 0.5, 0.8],
                  colors: _backgroundColor)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                logoImage,
                fit: BoxFit.contain,
                height: 60.0,
                width: 60.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Olá',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    'Carlos',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: _borderContainer,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.2, 0.4, 0.6, 0.8],
                            colors: _actionContainerColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 70,
                          child: Center(
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  'R\$ 800,00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  'Disponivel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _iconColor, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.5),
                          ),
                          children: [
                            TableRow(children: [
                              InkWell(
                                onTap: () {
                                  navegateToSend();
                                },
                                child: Container(
                                  child: _actionList(
                                      'assets/images/ic_send.png', 'Enviar'),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    navegateToBuy();
                                  },
                                  child: Container(
                                    child: _actionList(
                                        'assets/images/ic_money.png',
                                        'Comprar'),
                                  )),
                            ]),
                            TableRow(children: [
                              InkWell(
                                onTap: () {
                                  navegateToTransaction();
                                },
                                child: Container(
                                  child: _actionList(
                                      'assets/images/ic_transact.png',
                                      'Transações'),
                                ),
                              ),
                              _actionList('assets/images/ic_reward.png',
                                  'PayMe Rewards'),
                            ])
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _actionList(var icon, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            fit: BoxFit.contain,
            height: 45.0,
            width: 45.0,
            color: _iconColor,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor),
          )
        ],
      ),
    );
  }
}
