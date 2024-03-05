import 'package:flutter/material.dart';
import 'package:mbloom/pages/add_garden.dart';
import 'package:mbloom/pages/home_page.dart';
import 'package:mbloom/pages/my_garden.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [
            Text('Acceuil'),
            Text('Liste des jardins'),
            Text('Formulaire')
          ][_currentIndex],
        ),
        body: [
          HomePage(),
          MyGarden(),
          AddGarden()

        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Acceuil'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Jardins'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Ajout'
            ),
          ],
          onTap: (index) => setCurrentIndex(index),
        ),
      ),
    );
  }
}

