import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:news_app/utilites/helper.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Color> colorList = [
    Colors.indigo,
    Colors.brown,
    Colors.orange,
  ];
  Random random = Random();
  Color getRandomColor() {
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  drawAuthorRow(),
                  SizedBox(
                    height: 15,
                  ),
                  drawDescRow(),
                ],
              ),
            ),
          );
        });
  }

  Widget drawAuthorRow() {
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
                Text(
                  'د.طالب الموسوي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            color: getRandomColor(),
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {})
      ],
    );
  }

  Widget drawDescRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/placeholder-bg.png'),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                lipsum.createWord(numWords: 6),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                lipsum.createSentence(),
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              )
            ],
          ),
        )
      ],
    );
  }
}
