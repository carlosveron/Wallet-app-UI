import 'package:flutter/material.dart';

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


List<Map<String, String>> transactionslist = [
  {
    'name': 'Carlos',
    'value': '200.00',
    'time': '16:08',
    'message': 'Lorem ipsum dolor sit amet'
  },
  {
    'name': 'Eduardo',
    'value': '22.10',
    'time': '16:08',
    'message': 'Lorem ipsum dolor sit amet'
  },
  {
    'name': 'Ramona',
    'value': '199.99',
    'time': '16:08',
    'message': 'Lorem ipsum dolor sit amet'
  },
];

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final list = ListView.builder(
    itemCount: transactionslist.length,
    itemBuilder: (_, index) {
      return ListTile(
        title: new RichText(
          text: new TextSpan(
            children: <TextSpan>[
              new TextSpan(
                text: '@${transactionslist[index]['name']} ',
                style: new TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              new TextSpan(
                  text: 'pagou a ', style: TextStyle(color: Colors.black)),
              new TextSpan(
                text: 'você',
                style: new TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        subtitle: new RichText(
          text: new TextSpan(
            children: <TextSpan>[
              new TextSpan(
                text: '${transactionslist[index]['message']} \n',
                style: new TextStyle(color: Colors.grey, fontSize: 14),
              ),
              new TextSpan(
                text: 'R\$ ${transactionslist[index]['value']} ',
                style: new TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://static.india.com/wp-content/uploads/2016/07/Emma-Watson.jpg'),
        ),
      
        contentPadding: EdgeInsets.only(bottom: 10),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorCustom,
            bottom: TabBar(
              tabs: [
                Text('Todos'),
                Text('Você'),
              ],
            ),
            title: Text('Transações'),
          ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Expanded(
                    child: list,
                  ),
                ],
              ),
           Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Expanded(
                    child: list,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
