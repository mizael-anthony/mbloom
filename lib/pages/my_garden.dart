import 'package:flutter/material.dart';
import 'package:mbloom/models/garden.dart';

class MyGarden extends StatefulWidget {
  const MyGarden({super.key});

  @override
  State<MyGarden> createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {

  final List<Garden> gardens = [
    Garden(name: "Jardin potager", description: "C'est un jardin", img: "fruit"),
    Garden(name: "Jardin aromatique", description: "C'est un jardin", img: "legume"),
    Garden(name: "Jardin fleuri", description: "C'est un jardin", img: "fleurs"),
  ];

  @override
  Widget build(BuildContext context) {

    Future<void> _showGardenInfo(Garden garden) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image.asset("assets/images/${garden.img}.png", height: 120),
                  const Text('This is a demo alert dialog.'),
                  const Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Center(
      child: ListView.builder(
        itemCount: gardens.length,
        itemBuilder: (context, index){
          final garden = gardens[index];
          final name = garden.name;
          final description = garden.description;
          final img = garden.img;

          return Card(
            child: ListTile(
              leading: Image.asset('assets/images/$img.png'),
              title: Text(name),
              subtitle: Text(description),
              trailing: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () => _showGardenInfo(garden),
              ),
            ),
          );
        },
      ),
    );
  }
}

