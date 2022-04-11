import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class BanquetsDetail extends StatefulWidget {
  var image;
  var home;
  BanquetsDetail({Key? key, required this.image, required this.home})
      : super(key: key);

  @override
  State<BanquetsDetail> createState() => _BanquetsDetailState();
}

class _BanquetsDetailState extends State<BanquetsDetail> {
  bool like = false;
  List images = [
    'assets/images/marriage1.jpg',
    'assets/images/marriage2.jpg',
    'assets/images/marriage3.jpg',
    'assets/images/marriage2.jpg',
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
  ];
  List buttonText = [
    'Book',
    'Enquiry',
    'Call',
    'Review',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    // color: primary,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.image.toString(),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.home.toString(),
                      style: bigWhite,
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: primary,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Starting from Rs.65000/',
                    style: homePage,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 22,
                        color: Colors.orange,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '(4.0)',
                          style: homePageSmall,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        child: Icon(
                          like
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          color: primary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Text(
                    'Defence Phase 1, Adjacent PSO Pump, Near KPT Interchange، Defence View Housing Society, Karachi, Karachi City, Sindh 75500',
                    style: homePageSmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: size.height * 0.05,
                  width: size.width * 0.22,
                  child: Center(
                    child: Text(
                      buttonText[index],
                      style: normWhite,
                    ),
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
                children: [
                  Text(
                    'Images',
                    style: homePage,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.24,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            images[index],
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
    );
  }
}
