import 'package:banquet_booking/Home/browse.dart';
import 'package:banquet_booking/banquets/banquetsDetail.dart';
import 'package:banquet_booking/banquets/seemore.dart';
import 'package:banquet_booking/stickyheader.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    // 'assets/images/hall3.jpg',
    // 'assets/images/makeup.jpg',
    // 'assets/images/catering.jpeg',
    // 'assets/images/cars.jpeg',
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
  ];
  List halls = [
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
  ];
  List text = [
    'Banquets',
    'Marquees',
    'Marriage Lawns',
    'Ball Room',
  ];
  List names = [
    'Banquet Karimabad',
    'Banquet Defence',
    'Banquet Nazimabad',
    'Banquet Gulshan',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.33,
                viewportFraction: 1,
              ),
              items: [
                'assets/images/marriage1.jpg',
                'assets/images/marriage2.jpg',
                'assets/images/marriage3.jpg',
                'assets/images/marriage2.jpg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              black.withOpacity(0.4), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: AssetImage(
                            i,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Shaadi Karle',
                          style: TextStyle(
                            fontSize: 30,
                            color: white,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white70,
                  primary.withOpacity(0.8),
                ],
              )),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width * 0.95,
                    // padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most popular banquets',
                          style: homePage,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeeMore(),
                              ),
                            );
                          },
                          child: Text(
                            'See More',
                            style: seeMorePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                            halls.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BanquetsDetail(
                                            image: halls[index],
                                            home: names[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            halls[index],
                                          ),
                                        ),
                                        color: primary,
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      height: size.height * 0.25,
                                      width: size.width * 0.5,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    // height: size.height * 0.08,
                                    width: size.width * 0.5,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                names[index],
                                                style: normal(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Rs.650 per head',
                                                style: homePageSmall,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: List.generate(
                                                    5,
                                                    (index) => const Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/wedding.jpg'),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.65,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        child: Center(
                          child: Text(
                            'Get 20% off on multiple banquets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width * 0.95,
                    // padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Budget banquets',
                          style: homePage,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeeMore(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width * 0.25,
                            height: size.height * 0.04,
                            child: Center(
                              child: Text(
                                'See More',
                                style: seeMore,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                            halls.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BanquetsDetail(
                                            image: halls[index],
                                            home: names[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            halls[index],
                                          ),
                                        ),
                                        color: primary,
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      height: size.height * 0.25,
                                      width: size.width * 0.5,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    // height: size.height * 0.07,
                                    width: size.width * 0.5,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                names[index],
                                                style: normal(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Rs. 65000',
                                                style: homePageSmall,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: List.generate(
                                                        5,
                                                        (index) => const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.orange,
                                                              size: 14,
                                                            ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/hall2.jpg'),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.65,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        child: Center(
                          child: Text(
                            'Get 20% off on multiple banquets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width * 0.95,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Our Services',
                          style: homePage,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        categories.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    black.withOpacity(0.4), BlendMode.darken),
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  categories[index],
                                ),
                              ),
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: size.height * 0.15,
                            width: size.width * 0.95,
                            child: Center(
                              child: Text(
                                text[index],
                                style: TextStyle(
                                  color: white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
