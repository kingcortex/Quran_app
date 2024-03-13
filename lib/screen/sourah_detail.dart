import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quoran/model/data.dart';
import 'package:quoran/theme/app_theme.dart';
import 'package:quoran/widgets/verser_tile.dart';

class SourahDetailPage extends StatefulWidget {
  const SourahDetailPage({super.key});

  @override
  State<SourahDetailPage> createState() => _SourahDetailPAgeState();
}

class _SourahDetailPAgeState extends State<SourahDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> bottomToTop;
  late Animation<Offset> leftToRight;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    bottomToTop =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: const Offset(0, 0))
            .animate(controller);

    leftToRight =
        Tween<Offset>(begin: const Offset(-0.5, 0.0), end: const Offset(0, 0))
            .animate(controller);

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Gap(80),
            buildAppBar(context),
            const Gap(25),
            SlideTransition(
              position: leftToRight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    width: double.infinity,
                    height: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffDFCBF4),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        )
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/Quran.png',
                      height: 195,
                      width: 275,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Al-Fatiah",
                        style: AppTheme.textStyle(
                          fontSize: 26,
                          color: AppTheme.baseColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        "The Opening",
                        style: AppTheme.textStyle(
                          fontSize: 16,
                          color: AppTheme.baseColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 1,
                        width: 200,
                        color: AppTheme.baseColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "MECCAN",
                            style: AppTheme.textStyle(
                              fontSize: 14,
                              color: AppTheme.baseColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(5),
                          SvgPicture.asset('assets/point.svg'),
                          Text(
                            "7 VERSES",
                            style: AppTheme.textStyle(
                              fontSize: 14,
                              color: AppTheme.baseColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(32),
                      SvgPicture.asset('assets/vector.svg'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: bottomToTop,
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    for (int i = 0; i < Data.versets.length; i++)
                      VerserTile(
                        index: i + 1,
                        ar: Data.versets[i]["ar"]!,
                        en: Data.versets[i]["en"]!,
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset('assets/back.svg'),
            ),
            const Gap(24),
            Text(
              "Quran App",
              style: AppTheme.textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor),
            ),
          ],
        ),
        SvgPicture.asset('assets/search.svg'),
      ],
    ),
  );
}
