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
    'assets/images/marriage2.jpg',
  ];
  List halls = [
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
  ];
  List text = [
    'Halls',
    'Makeup',
    'Catering',
    'Cars',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Center(child: Text('Shaadi Karle')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                // autoPlay: true,
                height: size.height * 0.25,
                // aspectRatio: 1.0,
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
                          fit: BoxFit.cover,
                          image: AssetImage(
                            i,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most popular banquets',
                    style: homePage,
                  ),
                  Text(
                    'See More',
                    style: seeMore,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      halls.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                halls[index],
                              ),
                            ),
                            color: primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   // height: size.height * 0.2,
                  //   width: size.width * 0.4,
                  //   child: Row(
                  //     children: [Text('adsd')],
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Offers for you',
              style: homePage,
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
                  'Get 20% off on multiple banquets',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: homePage,
                  ),
                  Text(
                    'See More',
                    style: seeMore,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              black.withOpacity(0.5), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: AssetImage(
                            categories[index],
                          ),
                        ),
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: size.height * 0.2,
                      width: size.width * 0.4,
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
            ),
          ],
        ),
      ),
    );
  }
}
