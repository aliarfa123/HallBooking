import 'package:banquet_booking/Home/homepage.dart';
import 'package:banquet_booking/provider.dart';
import 'package:banquet_booking/rootApp.dart';
import 'package:banquet_booking/stickyheader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LikeProvider(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyBehavior(),
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'PlusJakartaSans',
          primarySwatch: Colors.blue,
        ),
        home: RootApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
