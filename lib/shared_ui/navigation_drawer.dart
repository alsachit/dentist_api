import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/facebook_feed.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/dentist_screen.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/screens/instagram_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> menuItems = [
    NavMenuItem('الرئيسية', () => HomeScreen()),
    NavMenuItem('طب الاسنان', () => DentisScreen()),
    NavMenuItem('Twitter', () => TwitterFeed()),
    NavMenuItem('Instagram', () => InstagramFeed()),
    NavMenuItem('Facebook', () => FacebookFeed()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                title: Text(
                  menuItems[position].title,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              menuItems[position].destination()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
