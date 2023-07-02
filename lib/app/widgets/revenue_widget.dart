import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_ordo/app/utils/helpers.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';
import 'package:test_ordo/domain/entities/chart_sample_data.dart';

final List<String> _timeframe = ['Daily', 'Weekly', 'Monthly'];

class RevenueWidget extends StatefulWidget {
  const RevenueWidget({Key? key}) : super(key: key);

  @override
  State<RevenueWidget> createState() => _RevenueWidgetState();
}

class _RevenueWidgetState extends State<RevenueWidget> {
  final _chartData = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: 260000),
    ChartSampleData(x: 'Tue', y: 255000),
    ChartSampleData(x: 'Wed', y: 235000),
    ChartSampleData(x: 'Thu', y: 250000),
    ChartSampleData(x: 'Fri', y: 265000),
    ChartSampleData(x: 'Sat', y: 255000),
    ChartSampleData(x: 'Sun', y: 245000),
  ];

  String _timeframeValue = _timeframe.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC440A6),
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: <Widget>[
          // Total Revenue
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Revenue',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Rp 257.500.000',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 24,
                    color: OrdoColors.white,
                  ),
                  elevation: 0,
                  position: PopupMenuPosition.under,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  itemBuilder: (context) => _timeframe
                      .map((e) => PopupMenuItem(
                          value: e,
                          height: 33,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: e == _timeframeValue
                                  ? OrdoColors.mainPurple
                                  : OrdoColors.black,
                            ),
                          )))
                      .toList(),
                  onSelected: (value) {
                    setState(() {
                      _timeframeValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          // Chart
          SizedBox(
            height: 185,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelPlacement: LabelPlacement.betweenTicks,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: 150000,
                maximum: 300000,
                isVisible: false,
              ),
              series: <SplineAreaSeries<ChartSampleData, String>>[
                SplineAreaSeries(
                  dataSource: _chartData,
                  xValueMapper: (datum, index) => datum.x as String,
                  yValueMapper: (datum, index) => datum.y,
                  markerSettings: const MarkerSettings(isVisible: true),
                  borderColor: OrdoColors.white,
                  borderWidth: 2,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff5d0193).withOpacity(0.5),
                      OrdoColors.mainPurple,
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, point, series, pointIndex, seriesIndex) =>
                    Container(
                  decoration: BoxDecoration(
                    color: OrdoColors.darkPurple,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  child: Text(
                    oCcy.format(point.y),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.11,
                      color: OrdoColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Slider Controller
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              top: 5,
              right: 30,
              bottom: 17,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 26,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: OrdoColors.gray1.withOpacity(0.5),
                  ),
                ),
                Container(
                  width: 26,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: OrdoColors.white,
                  ),
                ),
                Container(
                  width: 26,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: OrdoColors.gray1.withOpacity(0.5),
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
