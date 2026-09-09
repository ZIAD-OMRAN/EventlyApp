import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:envently/screens/createAccount.dart';
import 'package:envently/screens/forgetPssword.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:envently/widgets/textform.dart';
import 'package:envently/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class Createaccount extends StatelessWidget {
  const Createaccount({super.key});
  static String routename = 'Createaccount';
  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(Appimages.Logo, width: screenwidth * .4),
            ),
          ),
          Textform(hint: Text('Name'), prefixIcon: Icon(Icons.person_2)),
          Textform(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Email';
              }
              if (!value.contains('@gmail.com')) {
                return 'Please Enter valid Email';
              }
              return null;
            },

            hint: Text('Email'),
            prefixIcon: Icon(Icons.email_rounded),
          ),
          Textform(
            hint: Text('Password'),
            prefixIcon: Icon(Icons.lock_rounded),
          ),
          Textform(
            hint: Text('Re Password'),
            prefixIcon: Icon(Icons.lock_rounded),
          ),

          Bottonwidget(text: 'Create Account'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have Account ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Textwidget(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Login',
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/Group 9.png',
              width: screenwidth * .3,
              height: screenheight * .04,
            ),
          ),
        ],
      ),
    );
  }
}
