import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/mbloom.png',
          width: 200,
        ),
        const Text(
          'Votre jardin en un click',
          style: TextStyle(fontSize: 42, fontFamily: 'Poppins'),
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
      ],
    ));
  }
}
