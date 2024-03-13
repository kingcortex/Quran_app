import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:quoran/theme/app_theme.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Gap(80),
            buildAppBar(context),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/folder-plus.svg'),
                    const Gap(10),
                    Text(
                      "Add new collection",
                      style: AppTheme.textStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/sort.svg")
              ],
            ),
            const Gap(32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/folder.svg'),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add new collection",
                          style: AppTheme.textStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "8 items",
                          style: AppTheme.textStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset('assets/more.svg')
              ],
            ),
            const Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/folder.svg'),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily",
                          style: AppTheme.textStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "5 items",
                          style: AppTheme.textStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset('assets/more.svg')
              ],
            ),
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
            SvgPicture.asset('assets/menu.svg'),
            const Gap(24),
            Text(
              "Bookmarks",
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
