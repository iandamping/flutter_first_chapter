import 'package:flutter/material.dart';

import 'FirstExpanded.dart';
import 'FirstFlexible.dart';
import 'FirstListView.dart';
import 'FirstNavigation.dart';
import 'detail_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(fontFamily: "Oswald"),
      // home: DetailScreen(),
      // home: FirstDropDownBottom(),
      // home: FirstTextField(),
      // home: FirstNetworkImage(),
      // home: FirstAssetImage(),
      // home: FirstDynamicListView(),
      // home: FirstExpanded(),
      // home: FirstFlexible(),
      // home: FirstScreen(),
      home: MainScreen(),
    );
  }
}
