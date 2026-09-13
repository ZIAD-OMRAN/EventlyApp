import 'package:envently/home/hometab/cards_widget.dart';
import 'package:envently/home/hometab/homeHeader.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Homeheader(), CardsWidget()]),
    );
  }
}
