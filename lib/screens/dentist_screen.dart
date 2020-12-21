import 'package:flutter/material.dart';
import 'package:news_app/screens/home_tabs/favourite.dart';
import 'package:news_app/screens/home_tabs/popular.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/utilites/helper.dart';

class DentisScreen extends StatefulWidget {
  @override
  _DentisScreenState createState() => _DentisScreenState();
}

class _DentisScreenState extends State<DentisScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(getTranslated(context, 'navbar_title2')),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorColor: Colors.amber,
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Almarai'),
          controller: tabController,
          tabs: [
            Tab(
              text: getTranslated(context, 'tab_title1'),
            ),
            Tab(
              text: getTranslated(context, 'tab_title2'),
            ),
            Tab(
              text: getTranslated(context, 'tab_title3'),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [Favourite(), Popular(), Favourite()],
      ),
    );
  }
}
