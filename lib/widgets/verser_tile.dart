import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:quoran/theme/app_theme.dart';

class VerserTile extends StatefulWidget {
  final int index;
  final String ar;
  final String en;
  const VerserTile(
      {super.key, required this.index, required this.ar, required this.en});

  @override
  State<VerserTile> createState() => _VerserTileState();
}

class _VerserTileState extends State<VerserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1, color: const Color(0xff121931).withOpacity(0.1)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            height: 47,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff121931).withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppTheme.primaryColor),
                  child: Text(
                    widget.index.toString(),
                    style: AppTheme.textStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.baseColor),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/share.svg"),
                    const Gap(16),
                    SvgPicture.asset("assets/play.svg"),
                    const Gap(16),
                    SvgPicture.asset("assets/save.svg"),
                  ],
                )
              ],
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.ar,
                style: AppTheme.textStyle(
                    color: const Color(0xff240F4F), fontSize: 18),
              ),
            ],
          ),
          const Gap(10),
          Text(
            widget.en,
            style: AppTheme.textStyle(
              fontSize: 16,
              color: const Color(0xff240F4F),
            ),
          )
        ],
      ),
    );
  }
}
