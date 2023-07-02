import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';

class KpiWidget extends StatefulWidget {
  const KpiWidget({Key? key}) : super(key: key);

  @override
  State<KpiWidget> createState() => _KpiWidgetState();
}

class _KpiWidgetState extends State<KpiWidget> {
  final List<Map<String, dynamic>> _kpi = [
    {
      'icon': 'store.svg',
      'color': OrdoColors.purple[100],
      'title': 'Total Lead',
      'point': 57,
      'growth': 3.5,
    },
    {
      'icon': 'fire.svg',
      'color': OrdoColors.lightRed,
      'title': 'Hot Lead',
      'point': 28,
      'growth': -1.25,
    },
    {
      'icon': 'check.svg',
      'color': OrdoColors.green1,
      'title': 'Total Deals',
      'point': 100,
      'growth': 0,
    },
    {
      'icon': 'flag.svg',
      'color': OrdoColors.green2,
      'title': 'Grand Opening',
      'point': 150,
      'growth': 3.5,
    },
    {
      'icon': 'snow.svg',
      'color': const Color(0xff2873ff),
      'title': 'Cold Lead',
      'point': 45,
      'growth': 3.5,
    },
    {
      'icon': 'clear.svg',
      'color': OrdoColors.red,
      'title': 'Failed Deal',
      'point': 13,
      'growth': 3.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: SvgPicture.asset(
                      'assets/svg/kpi_coloured.svg',
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const TextSpan(
                    text: ' Key Performance Indicator',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: OrdoColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 135,
            child: ListView.builder(
              itemCount: _kpi.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) => Container(
                width: 120,
                height: 95,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: OrdoColors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0x1f7864e6),
                      offset: Offset(0, 1),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: _kpi.elementAt(index)["color"],
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: SvgPicture.asset(
                                'assets/svg/${_kpi.elementAt(index)["icon"]}',
                                width: 11,
                                height: 11,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: '${_kpi.elementAt(index)["title"]}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: OrdoColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        '${_kpi.elementAt(index)['point']}',
                        style: Get.textTheme.labelLarge,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Last month',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                            color: OrdoColors.gray2,
                          ),
                        ),
                        Text(
                          '${_kpi.elementAt(index)['growth'] > 0 ? '+' : ''}${_kpi.elementAt(index)['growth']}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                            color: _kpi.elementAt(index)['growth'] >= 0.0
                                ? OrdoColors.black
                                : OrdoColors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffefeaea),
                  ),
                ),
                Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: OrdoColors.purple,
                  ),
                ),
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffefeaea),
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
