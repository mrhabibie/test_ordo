import 'package:flutter/material.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';
import 'package:test_ordo/app/utils/ordo_icons.dart';
import 'package:test_ordo/app/widgets/kpi_widget.dart';
import 'package:test_ordo/app/widgets/leaderboards_widget.dart';
import 'package:test_ordo/app/widgets/recent_lead_widget.dart';
import 'package:test_ordo/app/widgets/revenue_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _menu = [
    {
      'icon': OrdoIcons.home,
      'label': 'Home',
    },
    {
      'icon': Icons.list_alt,
      'label': 'Lead',
    },
    {
      'icon': OrdoIcons.clock_circle,
      'label': 'Commission',
    },
    {
      'icon': OrdoIcons.user,
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC440A6),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              OrdoIcons.notification,
              size: 24,
              color: OrdoColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: Image.asset(
              'assets/icons/user.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // Section: Total Revenue
            const RevenueWidget(),
            // Another sections
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              decoration: const BoxDecoration(
                color: OrdoColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: const Column(
                children: <Widget>[
                  // Section: KPI
                  KpiWidget(),
                  // Section: Recent Lead
                  RecentLeadWidget(),
                  // Section: Leaderboards
                  LeaderboardsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: OrdoColors.darkPurple,
            selectedItemColor: OrdoColors.white,
            selectedFontSize: 11,
            unselectedItemColor: OrdoColors.white,
            unselectedFontSize: 11,
            showUnselectedLabels: true,
            items: _menu
                .map((e) => BottomNavigationBarItem(
                      icon: Icon(e['icon']),
                      label: e['label'],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
