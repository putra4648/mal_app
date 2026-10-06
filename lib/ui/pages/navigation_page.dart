import 'package:flutter/material.dart';
import 'package:manga_app/ui/screens/home_screen.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        HomeScreen(tabController: tabController),
        // ScheduleScreen(tabController: tabController),
      ],
    );
  }
}
