import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/utilites/helper.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Twitter'),
          centerTitle: false,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      cardHeader(),
                      SizedBox(
                        height: 15,
                      ),
                      cardBody(),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(),
                      cardFooter()
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget cardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'د.طالب الموسوي',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '@dr.talib',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('15 ' + getTranslated(context, 'time_minute'),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 7,
                    ),
                    Text(getTranslated(context, 'flag_title1'),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget cardBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                lipsum.createSentence(),
                style: TextStyle(
                    fontSize: 18, color: Colors.grey.shade700, height: 1.5),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.repeat, color: Colors.deepOrange),
                onPressed: () {}),
            Text('24')
          ],
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'مشاركة',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'فتح',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
