import 'package:flutter/material.dart';
import 'package:news_app/utilites/helper.dart';

class Offers extends StatefulWidget {
  @override
  _OfferstState createState() => _OfferstState();
}

class _OfferstState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [drawHeader(), drawLastOffers()],
      ),
    );
  }

  Widget drawHeader() {
    TextStyle headerTitle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle headerDesc = TextStyle(color: Colors.white, fontSize: 14);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/images/placeholder-bg.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابتسامة المشاهير',
                style: headerTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'احصل على ابتسامة جميلة تشبه ابتسامة المشاهير كل ما عليك هو الاتصال بالمركز الان',
                style: headerDesc,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawLastOffers() {
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child:
                  drowSectionTitle(getTranslated(context, 'section_title1'))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: Column(
                children: [
                  drawSingleRow(),
                  Divider(),
                  drawSingleRow(),
                  Divider(),
                  drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: drowSectionTitle(
                      getTranslated(context, 'section_title2')),
                ),
                drawRecentOffersCard(Colors.indigo),
                drawRecentOffersCard(Colors.green.shade500),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
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

  Widget drowSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade600,
        fontSize: 16,
      ),
    );
  }

  Widget drawRecentOffersCard(Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/placeholder-bg.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                getTranslated(context, 'flag_title1'),
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Text(
              'زراعة الاسنان متوفرة في المركز احصل على اسنان جميلة تليق بمضهرك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  '15 ' + getTranslated(context, 'time_minute'),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
