import 'package:flutter/material.dart';
import 'package:news_app/lang/applocal.dart';
import 'package:news_app/utilites/helper.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  List<PageModel> pages = List<PageModel>();
  ValueNotifier<int> pageViewNotifire = ValueNotifier(0);

  void createPage() {
    pages.add(
      PageModel(
        getTranslated(context, 'onBording_desc1'),
        'assets/images/logo.png',
        getTranslated(context, 'onBording_title1'),
      ),
    );
    pages.add(
      PageModel(
        getTranslated(context, 'onBording_desc2'),
        'assets/images/1.jpg',
        getTranslated(context, 'onBording_title2'),
      ),
    );
    pages.add(
      PageModel(
        getTranslated(context, 'onBording_desc3'),
        'assets/images/2.jpg',
        getTranslated(context, 'onBording_title3'),
      ),
    );
    pages.add(
      PageModel(
        getTranslated(context, 'onBording_desc4'),
        'assets/images/3.jpg',
        getTranslated(context, 'onBording_title4'),
      ),
    );
  }

  Widget displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: pageViewNotifire,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.teal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    createPage();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -50),
                          child: Image(
                            image:
                                ExactAssetImage(pages[index].image, scale: 2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            pages[index].title,
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Almarai-Bold'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 25),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(fontSize: 18, height: 2),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            onPageChanged: (index) {
              pageViewNotifire.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, -130),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: displayPageIndicators(pages.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    updateSeen();
                  },
                  child: Text(
                    getTranslated(context, 'onBording_button_title'),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Almarai',
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

class PageModel {
  String _title;
  String _description;
  String _image;

  PageModel(this._description, this._image, this._title);

  String get title => _title;
  String get description => _description;
  String get image => _image;
}
