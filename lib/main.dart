import 'package:envently/consts/appthem.dart';
import 'package:envently/screens/onbordingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routename,
      routes: {
        OnboardingScreen.routename: (context) => const OnboardingScreen(),
      },
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
    );
  }
}
