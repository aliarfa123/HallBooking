import 'package:banquet_booking/Booking/review.dart';
import 'package:banquet_booking/provider.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BanquetsDetail extends StatefulWidget {
  var image;
  var home;
  BanquetsDetail({Key? key, required this.image, required this.home})
      : super(key: key);

  @override
  State<BanquetsDetail> createState() => _BanquetsDetailState();
}

class _BanquetsDetailState extends State<BanquetsDetail> {
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'n1Ddj7nsKfg',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
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
    'Call',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
    // List navigateButton = [
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Review(),
    //     ),
    //   ),
    //   launch("tel://214324234"),
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Review(),
    //     ),
    //   ),
    // ];

    bool? newLike = Provider.of<LikeProvider>(context).like;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   height: size.height * 0.4,
                //   decoration: BoxDecoration(
                //     // color: primary,
                //     image: DecorationImage(
                //       colorFilter: ColorFilter.mode(
                //         black.withOpacity(0.6),
                //         BlendMode.darken,
                //       ),
                //       fit: BoxFit.cover,
                //       image: AssetImage(
                //         widget.image.toString(),
                //       ),
                //     ),
                //   ),
                //   child: Center(
                //     child: Text(
                //       widget.home.toString(),
                //       style: bigWhite,
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(0),
                            actions: [
                              SizedBox(
                                height: size.height * 0.8,
                                width: size.width,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: size.height * 0.4,
                                    viewportFraction: 1,
                                  ),
                                  items: [
                                    'assets/images/hall2.jpg',
                                    'assets/images/hall3.jpg',
                                    'assets/images/hall2.jpg',
                                    'assets/images/hall1.jpg',
                                  ].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          alignment: Alignment.topRight,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                i,
                                              ),
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: black,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.35,
                      viewportFraction: 1,
                    ),
                    items: [
                      'assets/images/hall2.jpg',
                      'assets/images/hall3.jpg',
                      'assets/images/hall2.jpg',
                      'assets/images/hall1.jpg',
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
                    widget.home.toString(),
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
                          Provider.of<LikeProvider>(context, listen: false)
                              .changeLike(newLike);
                          // setState(() {
                          //   like = !like;
                          // });
                        },
                        child: Icon(
                          newLike
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
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'About Banquet:',
                    style: homePage,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Text(
                    "We, SKV Mahal in Mogappair, have an air-conditioned hall with a seating capacity of 1000 and a floating capacity of 1500. SKV Mahal in Mogappair provides a good number of facilities to organize an event. There is a generator backup for t the event to function smoothly during a power cut. SKV Mahal in Mogappair provides kitchen vessels and cooking fuel. The guests can prefer outdoor catering as well. The mahal provides air-conditioned rooms with locker facilities for the guests.",
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
                buttonText.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: size.height * 0.05,
                  width: size.width * 0.25,
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
            Container(
              alignment: Alignment.center,
              width: size.width * 0.95,
              child: YoutubePlayer(
                liveUIColor: primary,
                controller: controller,
                progressIndicatorColor: primary,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Images',
            //         style: homePage,
            //       ),
            //     ],
            //   ),
            // ),
            // SingleChildScrollView(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(
            //       images.length,
            //       (index) => Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           height: size.height * 0.25,
            //           width: size.width * 0.5,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8),
            //             image: DecorationImage(
            //               fit: BoxFit.cover,
            //               image: AssetImage(
            //                 images[index],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: size.height * 0.02,
            // ),
          ],
        ),
      ),
    );
  }
}
