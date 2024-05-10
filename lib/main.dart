import 'package:app_mobile_app_yeyo/src/my_web_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Basic Landing WebPage',
        debugShowCheckedModeBanner: false,
        home: MyWebPage(),
      ),
    ),
  );
}
