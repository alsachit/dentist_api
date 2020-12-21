import 'package:flutter/material.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/screens/home_tabs/offers.dart';
import 'package:news_app/screens/home_tabs/favourite.dart';
import 'package:news_app/screens/home_tabs/popular.dart';
import 'package:news_app/utilites/helper.dart';

enum popUpMenueItems { Help, About, Contact, Setting }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  AuthorAPI authorAPI = AuthorAPI();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authorAPI.fetchAllAuthor();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(getTranslated(context, 'navbar_title1')),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          popOutMenu(context)
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
        children: [
          Offers(),
          Popular(),
          Favourite(),
        ],
      ),
    );
  }

  Widget popOutMenu(BuildContext context) {
    return PopupMenuButton<popUpMenueItems>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<popUpMenueItems>(
            value: popUpMenueItems.About,
            child: Text('About'),
          ),
          PopupMenuItem<popUpMenueItems>(
            value: popUpMenueItems.Help,
            child: Text('Help'),
          ),
          PopupMenuItem<popUpMenueItems>(
            value: popUpMenueItems.Contact,
            child: Text('Contact'),
          ),
          PopupMenuItem<popUpMenueItems>(
            value: popUpMenueItems.Setting,
            child: Text('Setting'),
          ),
        ];
      },
      onSelected: (popUpMenueItems menueItems) {},
    );
  }
}
