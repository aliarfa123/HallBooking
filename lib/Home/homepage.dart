import 'package:banquet_booking/Home/browse.dart';
import 'package:banquet_booking/banquets/banquetsDetail.dart';
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
    'assets/images/hall3.jpg',
    'assets/images/makeup.jpg',
    'assets/images/catering.jpeg',
    'assets/images/cars.jpeg',
  ];
  List halls = [
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
  ];
  List text = [
    'Banquets',
    'Beauty Parlors',
    'Catering',
    'Rental Cars',
  ];
  List names = [
    'Banquet Karimabad',
    'Banquet Defence',
    'Banquet North Nazimabad',
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
                    width: size.width * 0.9,
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
                                builder: (context) => Search(),
                              ),
                            );
                          },
                          child: Text(
                            'See More',
                            style: seeMore,
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BanquetsDetail(
                                                  image: halls[index],
                                                  home: names[index],
                                                )),
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
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
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
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: size.height * 0.07,
                                    width: size.width * 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Wrap(
                                        alignment:
                                            WrapAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            names[index],
                                            style: norm,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '4.0',
                                                style: norm,
                                              ),
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.orange,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              black.withOpacity(0.5), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: const AssetImage('assets/images/wedding.jpg')),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: size.height * 0.22,
                    width: size.width * 0.9,
                    child: Center(
                      child: Text(
                        'Get 20% off on\n multiple banquets',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Container(
                  //   width: size.width * 0.9,
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Top Services',
                  //         style: homePage,
                  //       ),
                  //       // Text(
                  //       //   'See More',
                  //       //   style: seeMore,
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // SingleChildScrollView(
                  //   physics: const BouncingScrollPhysics(),
                  //   scrollDirection: Axis.vertical,
                  //   child: Column(
                  //     children: List.generate(
                  //       categories.length,
                  //       (index) => Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               colorFilter: ColorFilter.mode(
                  //                   black.withOpacity(0.5), BlendMode.darken),
                  //               fit: BoxFit.cover,
                  //               image: AssetImage(
                  //                 categories[index],
                  //               ),
                  //             ),
                  //             color: primary,
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           height: size.height * 0.15,
                  //           width: size.width * 0.9,
                  //           child: Center(
                  //             child: Text(
                  //               text[index],
                  //               style: TextStyle(
                  //                 color: white,
                  //                 fontSize: 22,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
