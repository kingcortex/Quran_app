import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:quoran/section/sourah_section.dart';
import 'package:quoran/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late AnimationController animationController;
  late Animation<Offset> rightToLeft;
  late Animation<Offset> bottomToTop;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animationController.forward();

    rightToLeft =
        Tween<Offset>(begin: const Offset(0.5, 0.0), end: const Offset(0, 0))
            .animate(animationController);
    bottomToTop =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: const Offset(0, 0))
            .animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(80),
          buildAppBar(context),
          const Gap(30),
          SizedBox(
            height: 30,
            child: DefaultTextStyle(
              style: AppTheme.textStyle(fontSize: 18),
              child: AnimatedTextKit(
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  RotateAnimatedText(
                    textAlign: TextAlign.start,
                    alignment: Alignment.topLeft,
                    rotateOut: false,
                    "Asslamualaikum",
                  ),
                ],
              ),
            ),
          ),
          DefaultTextStyle(
            style: AppTheme.textStyle(
              color: const Color(
                0xff240F4F,
              ),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              repeatForever: false,
              animatedTexts: [
                TyperAnimatedText(
                  "Diomande Souleymane",
                  speed: const Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
          const Gap(30),
          SlideTransition(
            position: rightToLeft,
            child: Stack(
              children: [
                Container(
                  height: 131,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/book.svg'),
                          const Gap(8),
                          Text(
                            "Last Read",
                            style: AppTheme.textStyle(
                              color: AppTheme.baseColor,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      Text(
                        "Al-Fatiah",
                        style: AppTheme.textStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.baseColor,
                        ),
                      ),
                      Text(
                        "Ayah No: 1",
                        style: AppTheme.textStyle(color: AppTheme.baseColor),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/Quran.svg'),
                )
              ],
            ),
          ),
          const Gap(20),
          TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              width: 3,
              color: AppTheme.primaryColor,
            )),
            labelPadding: const EdgeInsets.all(8.0),
            controller: tabController,
            tabs: [
              Text(
                "Surah",
                style: AppTheme.textStyle(
                  fontSize: 16,
                  color: tabController.index == 0
                      ? AppTheme.primaryColor
                      : AppTheme.textColor,
                  fontWeight: tabController.index == 0
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Text(
                "Para",
                style: AppTheme.textStyle(
                  fontSize: 16,
                  color: tabController.index == 1
                      ? AppTheme.primaryColor
                      : AppTheme.textColor,
                  fontWeight: tabController.index == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Text(
                "Page",
                style: AppTheme.textStyle(
                  fontSize: 16,
                  color: tabController.index == 2
                      ? AppTheme.primaryColor
                      : AppTheme.textColor,
                  fontWeight: tabController.index == 2
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Text(
                "Hijb",
                style: AppTheme.textStyle(
                  fontSize: 16,
                  color: tabController.index == 3
                      ? AppTheme.primaryColor
                      : AppTheme.textColor,
                  fontWeight: tabController.index == 3
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
          Expanded(
            child: SlideTransition(
              position: bottomToTop,
              child: TabBarView(
                controller: tabController,
                children: const [
                  SourahSection(),
                  SourahSection(),
                  SourahSection(),
                  SourahSection(),
                ],
              ),
            ),
          )
        ],
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
            SvgPicture.asset('assets/menu.svg'),
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
        SvgPicture.asset('assets/search.svg')
      ],
    ),
  );
}
