import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ordo/app/utils/helpers.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';
import 'package:test_ordo/app/widgets/label_widget.dart';

class RecentLeadWidget extends StatefulWidget {
  const RecentLeadWidget({Key? key}) : super(key: key);

  @override
  State<RecentLeadWidget> createState() => _RecentLeadWidgetState();
}

class _RecentLeadWidgetState extends State<RecentLeadWidget> {
  final List<Map<String, dynamic>> _leads = [
    {
      'avatar': 'user1.png',
      'name': 'Shinta Alexandra',
      'label': 'New Lead',
      'icon': 'star.svg',
      'color': OrdoColors.purple,
      'date': DateTime(2023, 01, 31),
      'amount': 13000000,
    },
    {
      'avatar': 'user2.png',
      'name': 'Vita Arsalansia',
      'label': 'Hot Lead',
      'icon': 'fire.svg',
      'color': OrdoColors.lightRed,
      'date': DateTime(2023, 01, 31),
      'amount': 13000000,
    },
    {
      'avatar': 'user3.png',
      'name': 'Meriko Yolanda',
      'label': 'Cold Lead',
      'icon': 'snow.svg',
      'color': OrdoColors.orange,
      'date': DateTime(2023, 01, 31),
      'amount': 13000000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 28, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Recent Lead',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: OrdoColors.black,
                ),
              ),
              Container(
                width: 19,
                height: 19,
                decoration: BoxDecoration(
                  color: const Color(0x1A7864E6),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 19,
                  color: OrdoColors.mainPurple,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...Iterable.generate(
                  _leads.length,
                  (index) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        'assets/icons/${_leads.elementAt(index)['avatar']}',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      _leads.elementAt(index)['name'],
                      style: Get.textTheme.bodySmall,
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          const WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.calendar_month,
                              size: 11.9,
                              color: OrdoColors.gray2,
                            ),
                          ),
                          TextSpan(
                              text: ' ${dateToString(
                            date: _leads.elementAt(index)["date"],
                            usingMonthName: true,
                            withYear: true,
                            separator: " ",
                          )}'),
                        ],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: OrdoColors.gray2,
                        ),
                      ),
                    ),
                    trailing: LabelWidget(
                      title: _leads.elementAt(index)['label'],
                      icon: _leads.elementAt(index)['icon'],
                      color: _leads.elementAt(index)['color'],
                      amount: _leads.elementAt(index)['amount'],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
