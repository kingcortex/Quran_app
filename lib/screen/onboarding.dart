import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quoran/app.dart';
import 'package:quoran/theme/app_theme.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.baseColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quran App",
                style: AppTheme.textStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Learn Quran and\n Recite once everyday",
                    style: AppTheme.textStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Gap(49),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    height: 450,
                    width: 314,
                    child: SvgPicture.asset('assets/onboarding.svg'),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 65,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const App(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 800),
                            popGesture: false);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 185,
                        decoration: BoxDecoration(
                            color: const Color(0xffF9B091),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Get Started",
                          style: AppTheme.textStyle(
                              color: AppTheme.baseColor, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
