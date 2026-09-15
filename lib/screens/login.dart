import 'package:envently/auth/google_auth.dart';
import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:envently/models/user_model.dart';
import 'package:envently/network/auth_servses.dart';
import 'package:envently/screens/createAccount.dart';
import 'package:envently/screens/forgetPssword.dart';
import 'package:envently/screens/mianLayer.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:envently/widgets/snake_bar.dart';
import 'package:envently/widgets/textform.dart';
import 'package:envently/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String routename = 'loginScreen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ispasswordAvaliable = false;
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(Appimages.Logo, width: screenwidth * .4),
                  ),
                ),
                Textform(
                  controller: EmailController,
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
                  controller: passwordController,
                  validator: passwordValidator,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispasswordAvaliable = !ispasswordAvaliable;
                      });
                    },
                    icon: Icon(
                      ispasswordAvaliable
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText: !ispasswordAvaliable,
                  hint: Text('Password'),
                  prefixIcon: Icon(Icons.lock_rounded),
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Textwidget(
                    onPressed: () {
                      Navigator.pushNamed(context, Forgetpssword.routename);
                    },
                    text: 'Forget Password?',
                  ),
                ),
                if (isloading)
                  Center(child: CircularProgressIndicator())
                else
                  Bottonwidget(
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;
                      try {
                        setState(() {
                          isloading = true;
                        });
                        UserModel? user = await AuthServses.login(
                          EmailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (user != null) {
                          SnackBarHelper.ShowSnakbarsucsess(
                            context,
                            'loged in',
                          );

                          Navigator.pushReplacementNamed(
                            context,
                            Mianlayer.routename,
                          );
                        } else {
                          SnackBarHelper.ShowSnakbarEROOR(
                            context,
                            'invlaid account',
                          );
                        }
                      } catch (e) {
                        SnackBarHelper.ShowSnakbarEROOR(context, e.toString());
                      }
                      setState(() {
                        isloading = false;
                      });
                    },
                    text: 'Login',
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have Account ?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Textwidget(
                      onPressed: () {
                        Navigator.pushNamed(context, Createaccount.routename);
                      },
                      text: 'Create Account',
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        thickness: 1,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.primaryColor,
                        thickness: 1,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () async {
                      var userCredientials = GoogleAuth.SinInWithgoogle();
                    },
                    child: Container(
                      width: screenwidth * 1,
                      height: screenheight * .06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: BoxBorder.all(color: AppColors.primaryColor),
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Appimages.google2, height: 30, width: 30),
                          Text(
                            'Login With Google',
                            style: TextStyle(
                              fontSize: 20,

                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                    activeThumbImage: AssetImage(Appimages.english),
                    inactiveThumbImage: AssetImage(Appimages.Egypt),
                  ),
                ),
              ],
            ),
          ),
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
