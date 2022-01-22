import 'package:bottom_indicator_bar_svg/bottom_indicator_bar_svg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titled Bar',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomIndicatorNavigationBarItem> items = [
    BottomIndicatorNavigationBarItem(icon: Icons.home, label: Text('Home')),
    BottomIndicatorNavigationBarItem(icon: Icons.search, label: 'Search'),
    BottomIndicatorNavigationBarItem(icon: 'assets/svgIcon.svg', label: 'Svg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indicator Bottom Bar"),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          ],
        ),
      ),
      bottomNavigationBar: BottomIndicatorBar(
        onTap: (index) => print("Selected Index: $index"),
        items: items,
        iconSize: 30.0,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        indicatorColor: Colors.blue,
        backgroundColor: Colors.black87,
      ),
    );
  }
}