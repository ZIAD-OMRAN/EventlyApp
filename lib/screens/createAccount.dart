import 'package:envently/consts/appimages.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:envently/widgets/textform.dart';
import 'package:envently/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});
  static String routename = 'Createaccount';

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  bool ispasswordAvaliable1 = false;
  bool ispasswordAvaliable2 = false;
  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Column(
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
              validator: passwordValidator,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    ispasswordAvaliable1 = !ispasswordAvaliable1;
                  });
                },
                icon: Icon(
                  ispasswordAvaliable1
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              obscureText: !ispasswordAvaliable2,
              hint: Text('Password'),
              prefixIcon: Icon(Icons.lock_rounded),
            ),
            Textform(
              validator: passwordValidator,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    ispasswordAvaliable2 = !ispasswordAvaliable2;
                  });
                },
                icon: Icon(
                  ispasswordAvaliable2
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
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
      ),
    );
  }
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain an uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain a lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain a number';
  }

  return null;
}
