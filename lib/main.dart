import 'package:covidinfo/src/pages/Home.dart';
import 'package:flutter/material.dart';

// pages
import 'src/models/LatestTotals.dart';
import 'src/pages/Home.dart';
import 'src/pages/Countries.dart';
import 'src/pages/About.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}


class MyHomePageState extends State<MyHomePage>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _widgetOptions = [
    HomePage(fetchAlbum()),
    CountriesPage(),
    AboutPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff23B9E8),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Mundo')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Países')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Sobre')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

}