import 'package:flutter/material.dart';
import 'package:test_ordo/app/utils/helpers.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';

class LeaderboardsWidget extends StatefulWidget {
  const LeaderboardsWidget({Key? key}) : super(key: key);

  @override
  State<LeaderboardsWidget> createState() => _LeaderboardsWidgetState();
}

class _LeaderboardsWidgetState extends State<LeaderboardsWidget> {
  final List<Map<String, dynamic>> _leaderboards = [
    {
      'number': 1,
      'name': 'Shinta Alexandra',
      'date': DateTime(2023, 01, 31),
      'avatar': 'user4.png',
      'deals': 45,
    },
    {
      'number': 2,
      'name': 'Jhonatan Zegwin',
      'date': DateTime(2023, 01, 31),
      'avatar': 'user5.png',
      'deals': 41,
    },
    {
      'number': 3,
      'name': 'Vita Arsalansia',
      'date': DateTime(2023, 01, 31),
      'avatar': 'user6.png',
      'deals': 34,
    },
    {
      'number': 4,
      'name': 'Meriko Yolanda',
      'date': DateTime(2023, 01, 31),
      'avatar': 'user7.png',
      'deals': 30,
    },
    {
      'number': 5,
      'name': 'Higuain Morelan',
      'date': DateTime(2023, 01, 31),
      'avatar': 'user8.png',
      'deals': 25,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 28, right: 30, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Leaderboards',
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
          ),
          ...Iterable.generate(
            _leaderboards.length,
            (index) => Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 20.5),
                  child: Text(
                    '${_leaderboards.elementAt(index)['number']}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: OrdoColors.mainPurple,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        'assets/icons/${_leaderboards.elementAt(index)['avatar']}',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      _leaderboards.elementAt(index)['name'],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      dateToString(
                        date: _leaderboards.elementAt(index)["date"],
                        usingMonthName: true,
                        withYear: true,
                        separator: " ",
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: OrdoColors.gray2,
                      ),
                    ),
                    trailing: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${_leaderboards.elementAt(index)['deals']}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: OrdoColors.mainPurple,
                            ),
                          ),
                          const TextSpan(
                            text: ' Deals',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: OrdoColors.gray2,
                            ),
                          ),
                        ],
                      ),
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
