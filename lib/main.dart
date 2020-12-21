import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/lang/applocal.dart';
import 'package:news_app/screens/home_screen.dart';
import 'screens/onbording.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilites/app_theme.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBording();
  } else {
    _screen = HomeScreen();
  }
  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: _screen,
      localizationsDelegates: [
        AppLocal.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', ''), Locale('ar', '')],
      locale: Locale('ar', ''),
      localeResolutionCallback: (currentLocal, supportedLocales) {
        if (currentLocal.languageCode != null) {
          for (Locale locale in supportedLocales) {
            if (locale.languageCode == currentLocal.languageCode) {
              return currentLocal;
            }
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
