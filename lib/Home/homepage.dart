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
  List text = [
    '1',
    '2',
    '3',
    '4',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: const Center(child: Text('Welcome to SHAADI KARO')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.25,
                aspectRatio: 1,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.blueGrey),
                        child: Center(
                          child: Text(
                            'Item $i',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Most popular banquets',
              style: homePage,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  text.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      child: Center(
                        child: Text(
                          text[index],
                        ),
                      ),
                    ),
                  ),
                ),
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
                color: primary,
                borderRadius: BorderRadius.circular(20),
              ),
              height: size.height * 0.22,
              width: size.width * 0.9,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Categories',
              style: homePage,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  text.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      child: Center(
                        child: Text(
                          text[index],
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
