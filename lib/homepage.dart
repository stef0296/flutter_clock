import 'package:flutter/material.dart';
import 'package:flutter_clock/clockview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Alarm',
    ),
    Container(
      alignment: Alignment.center,
      child: ClockView(),
    ),
    Text(
      'Index 2: Stopwatch',
    ),
    Text(
      'Index 3: Timer',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
              ),
              title: Text('Alarm')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
            ),
            title: Text('Clock')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.timer,
              ),
              title: Text('Stopwatch')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.hourglass_empty,
              ),
              title: Text('Timer')
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
