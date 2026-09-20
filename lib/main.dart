import 'package:envently/consts/appthem.dart';
import 'package:envently/consts/prefrenses.dart';
import 'package:envently/firebase_options.dart';
import 'package:envently/home/Events/chooseEventLocation.dart';
import 'package:envently/home/Events/createEvent.dart';
import 'package:envently/home/lovetab/lovescreen.dart';
import 'package:envently/home/maptab/mapscrean.dart';
import 'package:envently/home/profiletab/profile.dart';
import 'package:envently/screens/createAccount.dart';
import 'package:envently/screens/forgetPssword.dart';
import 'package:envently/screens/login.dart';
import 'package:envently/screens/mianLayer.dart';
import 'package:envently/screens/onbordingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: onboardingCompleted
          ? FirebaseAuth.instance.currentUser?.uid == null
                ? Login.routename
                : Mianlayer.routename
          : OnboardingScreen.routename,
      routes: {
        OnboardingScreen.routename: (context) => const OnboardingScreen(),

        Login.routename: (context) => const Login(),
        Forgetpssword.routename: (context) => const Forgetpssword(),
        Createaccount.routename: (context) => Createaccount(),
        Mianlayer.routename: (context) => Mianlayer(),
        Createevent.routename: (context) => Createevent(),
        Mapscrean.routename: (context) => Mapscrean(),
        Lovescreen.routename: (context) => Lovescreen(),
        Profile.routname: (context) => Profile(),
        Chooseeventlocation.routename: (context) => Chooseeventlocation(),
      },

      theme: AppTheme.lightTheme,
    );
  }
}
