import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_ordo/app/utils/helpers.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(
      {Key? key,
      required this.title,
      required this.color,
      this.icon,
      required this.amount})
      : super(key: key);

  final String title;
  final Color color;
  final String? icon;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 83,
          height: 22,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: <InlineSpan>[
                icon != null
                    ? WidgetSpan(
                        child: SvgPicture.asset('assets/svg/$icon',
                            width: 15, height: 15),
                        alignment: PlaceholderAlignment.middle,
                      )
                    : const WidgetSpan(
                        child: Center(),
                        alignment: PlaceholderAlignment.middle,
                      ),
                TextSpan(text: ' $title'),
              ],
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: OrdoColors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            oCcy.format(amount),
            style: Get.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
