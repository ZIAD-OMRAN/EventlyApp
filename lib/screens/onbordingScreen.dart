import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:envently/consts/prefrenses.dart';
import 'package:envently/models/onbordingModel.dart';
import 'package:envently/screens/login.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String routename = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> model = OnboardingModel.getOnboringDetails;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late PageController controller;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Appimages.header, height: screenheight * .07),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: model.length,
                itemBuilder: (context, index) {
                  OnboardingModel currentscreen = model[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(currentscreen.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            currentscreen.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          currentscreen.description,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.textligthcolor),
                        ),
                      ),
                      if (index == 0) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Language',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(color: AppColors.primaryColor),
                              ),
                              Image.asset(
                                'assets/images/Group 9.png',
                                height: screenheight * .04,
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Theme',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(color: AppColors.primaryColor),
                              ),

                              Image.asset(
                                'assets/images/Group 8.png',
                                height: screenheight * .04,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),

                        Bottonwidget(
                          onTap: () {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          text: 'Let’s Start',
                        ),
                      ],
                      Spacer(),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: (index == 2 || index == 3)
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.previousPage(
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeIn,
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_circle_left_outlined,
                                          color: AppColors.primaryColor,
                                          size: 40,
                                        ),
                                      )
                                    : null,
                              ),
                            ),

                            if (index != 0)
                              DotsIndicator(
                                dotsCount: model.length,
                                position: index.toDouble(),

                                decorator: DotsDecorator(
                                  color: AppColors.darkprimary,
                                  activeColor: AppColors.primaryColor,
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: index != 0
                                    ? GestureDetector(
                                        onTap: () async {
                                          if (index == 3) {
                                            await Prefrenses.onbording(
                                              Prefrenses.appObordingKey,
                                              true,
                                            );
                                            if (!mounted) return;

                                            Navigator.pushReplacementNamed(
                                              context,
                                              Login.routename,
                                            );

                                            return;
                                          }
                                          controller.nextPage(
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeIn,
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: AppColors.primaryColor,
                                          size: 40,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
