import 'package:banquet_booking/theme/color.dart';
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
                        decoration: BoxDecoration(color: Colors.blueGrey),
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
            const Text(
              'Most popular banquets',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Container(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: text.length,
            //     itemBuilder: ((context, index) {
            //       return Container(
            //         decoration: BoxDecoration(
            //           color: primary,
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         height: size.height * 0.2,
            //         width: size.width * 0.4,
            //         child: Center(
            //           child: Text(
            //             text[index],
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // ),

            Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(20),
              ),
              height: size.height * 0.22,
              width: size.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
