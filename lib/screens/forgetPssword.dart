import 'package:envently/consts/appimages.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:flutter/material.dart';

class Forgetpssword extends StatelessWidget {
  const Forgetpssword({super.key});
  static  String routename = 'Forgetpssword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Pssword')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(Appimages.forgetpass),
          ),
          Bottonwidget(text: 'Reset Password'),
        ],
      ),
    );
  }
}
