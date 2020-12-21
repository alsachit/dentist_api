import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/utilites/helper.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Instagram'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardHeader(),
                      SizedBox(
                        height: 15,
                      ),
                      cardTitle(),
                      cardHashtag(),
                      cardBody(),
                      SizedBox(
                        height: 5,
                      ),
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
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {}),
            Transform.translate(
              offset: Offset(10, 0),
              child: Text(
                '13',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget cardTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Text(lipsum.createWord(numWords: 5)),
    );
  }

  cardHashtag() {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          FlatButton(
            onPressed: () {},
            child: Text(
              '#عراق',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              '#عراق',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              '#عراق',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Image(
        image: ExactAssetImage('assets/images/placeholder-bg.png'),
      ),
    );
  }

  Widget cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '24',
              style: TextStyle(color: Colors.deepOrange),
            ),
            SizedBox(width: 5),
            Text('تعليق', style: TextStyle(color: Colors.deepOrange))
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
