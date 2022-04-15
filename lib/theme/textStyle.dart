// ignore: file_names
import 'package:banquet_booking/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var homePage = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: secondary,
);
var table = TextStyle(
  fontSize: 18,
  // fontWeight: FontWeight.bold,
  color: secondary,
);
var homePageSmall = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: secondary,
);

var seeMore = TextStyle(
  decoration: TextDecoration.underline,
  fontSize: 15,
  color: white,
  fontWeight: FontWeight.bold,
);

var seeMorePrimary = TextStyle(
  decoration: TextDecoration.underline,
  fontSize: 15,
  color: primary,
  fontWeight: FontWeight.bold,
);

var banquetName = TextStyle(
  fontSize: 18,
  color: primary,
  fontWeight: FontWeight.bold,
);

var norm = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: secondary,
);

normal(BuildContext context) {
  var normal = TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.bold,
    color: secondary,
  );
  return normal;
}

var normWhite = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: white,
);
var bigWhite = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: white,
);

var pageTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: white,
);
var normPrimary = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: primary,
);
