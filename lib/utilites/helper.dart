import 'package:flutter/material.dart';
import 'package:news_app/lang/applocal.dart';

String getTranslated(BuildContext context, String key) {
  return AppLocal.of(context).getTranslated(key);
}
