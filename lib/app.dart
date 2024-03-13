import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quoran/controller/bottom_bar_controller.dart';
import 'package:quoran/screen/fav_page.dart';
import 'package:quoran/screen/home_page.dart';
import 'package:quoran/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppController appController = Get.put(AppController());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppTheme.baseColor,
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 12.0,
            selectedFontSize: 12.0,
            showSelectedLabels: false,
            elevation: 8,
            backgroundColor: AppTheme.baseColor,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.index,
            items: [
              BottomNavigationBarItem(
                icon: controller.index == 0
                    ? SvgPicture.asset(
                        'assets/icon_home.svg',
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset('assets/icon_home.svg'),
                label: "Rechercher",
              ),
              BottomNavigationBarItem(
                icon: controller.index == 1
                    ? SvgPicture.asset(
                        'assets/ide.svg',
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset('assets/ide.svg'),
                label: "Rechercher",
              ),
              BottomNavigationBarItem(
                icon: controller.index == 2
                    ? SvgPicture.asset(
                        'assets/pri.svg',
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset('assets/pri.svg'),
                label: "Rechercher",
              ),
              BottomNavigationBarItem(
                icon: controller.index == 3
                    ? SvgPicture.asset(
                        'assets/dont.svg',
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset('assets/dont.svg'),
                label: "Rechercher",
              ),
              BottomNavigationBarItem(
                icon: controller.index == 4
                    ? SvgPicture.asset(
                        'assets/fav.svg',
                        colorFilter: ColorFilter.mode(
                            AppTheme.primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset('assets/fav.svg'),
                label: "Rechercher",
              ),
            ],
            onTap: (value) {
              controller.changePage(value);
            },
          ),
          body: IndexedStack(
            index: controller.index,
            children: [
              const HomePage(),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              const FavPage()
            ],
          ));
    });
  }
}
