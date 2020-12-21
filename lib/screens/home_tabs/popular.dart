import 'package:flutter/material.dart';
import 'package:news_app/utilites/helper.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, position) {
        return Card(
          child: Column(
            children: [drawSingleRow()],
          ),
        );
      },
    );
  }

  Widget drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 125,
            height: 125,
            child: Image(
                image: ExactAssetImage('assets/images/placeholder-bg.png'),
                fit: BoxFit.cover),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'عرض قلع سن العقل ب 30 الف دينار فقط احصل عليه الان',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated(context, 'flag_title1'),
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        Text(
                          '2 ' + getTranslated(context, 'date_day'),
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
