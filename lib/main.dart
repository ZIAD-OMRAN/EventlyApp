import 'package:envently/consts/appthem.dart';
import 'package:envently/consts/prefrenses.dart';
import 'package:envently/firebase_options.dart';
import 'package:envently/screens/createAccount.dart';
import 'package:envently/screens/forgetPssword.dart';
import 'package:envently/screens/login.dart';
import 'package:envently/screens/mianLayer.dart';
import 'package:envently/screens/onbordingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final bool onboardingCompleted = await Prefrenses.isOnboardingCompleted();
  runApp(MyApp(onboardingCompleted: onboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool onboardingCompleted;
  const MyApp({required this.onboardingCompleted, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: onboardingCompleted
          ? Login.routename
          : OnboardingScreen.routename,
      routes: {
        OnboardingScreen.routename: (context) => const OnboardingScreen(),

        Login.routename: (context) => const Login(),
        Forgetpssword.routename: (context) => const Forgetpssword(),
        Createaccount.routename: (context) => Createaccount(),
        Mianlayer.routename: (context) => Mianlayer(),
      },

      theme: AppTheme.lightTheme,
    );
  }
}
