import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quoran/model/sourah.dart';
import 'package:quoran/screen/sourah_detail.dart';
import 'package:quoran/theme/app_theme.dart';

class SourahSection extends StatefulWidget {
  const SourahSection({super.key});

  @override
  State<SourahSection> createState() => _SourahSectionState();
}

class _SourahSectionState extends State<SourahSection> {
  List<Sourah> listSurah = [
    Sourah(title: "Al-Fatiah", type: "Meccan", theme: "ةحتافلا", versers: 7),
    Sourah(
        title: "Al-Baqarah", type: "Medinian", theme: "ةرقبلا", versers: 286),
    Sourah(title: "Al 'Imran", type: "Meccan", theme: "ناﺮﻤﻋ لآ", versers: 200),
    Sourah(title: "An-Nisa", type: "Meccan", theme: "ءاسنلا", versers: 176),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: listSurah.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Get.to(() => const SourahDetailPage()),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffBBC4CE),
                ),
              ),
            ),
            height: 62,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset('assets/muslimIco.svg'),
                        Container(
                          alignment: Alignment.center,
                          width: 36,
                          height: 36,
                          child: Text(
                            "${index + 1}",
                            style: AppTheme.textStyle(
                              color: const Color(0xff240F4F),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listSurah[index].title,
                          style: AppTheme.textStyle(
                            fontSize: 16,
                            color: const Color(0xff240F4F),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              listSurah[index].type.toUpperCase(),
                              style: AppTheme.textStyle(fontSize: 12),
                            ),
                            const Gap(5),
                            SvgPicture.asset('assets/point.svg'),
                            Text(
                              "${listSurah[index].versers} VERSES",
                              style: AppTheme.textStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  listSurah[index].theme,
                  style: AppTheme.textStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
