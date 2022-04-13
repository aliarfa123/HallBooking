import 'package:banquet_booking/Booking/bookService.dart';
import 'package:banquet_booking/Booking/review.dart';
import 'package:banquet_booking/provider.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
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
  final imageList = [
    'assets/images/hall3.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
  ];
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
    'Book Now',
    'Call',
    'Reviews',
  ];
  List name = [
    'Abdullah',
    'Umar',
  ];
  List rating = [
    '4.5',
    '5',
  ];
  String review =
      'This marriage lawn is excellent. We had an\namazing experience here. Loved the decoration and arrangements a lot. We had a really good time here. The food was also amazing and the staff members were super professional and nice. Loved the venue!';
  @override
  Widget build(BuildContext context) {
    bool? newLike = Provider.of<LikeProvider>(context).like;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch('tel://2345678');
        },
        child: CircleAvatar(
          backgroundColor: primary,
          radius: 30,
          child: Icon(Icons.call, color: white, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (dialogContex) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(0),
                            actions: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      // color: Colors.transparent,
                                      height: size.height * 0.8,
                                      width: size.width * 1,
                                      child: PhotoViewGallery.builder(
                                        itemCount: 1,
                                        builder: (dialogContex, index) {
                                          return PhotoViewGalleryPageOptions(
                                            imageProvider: AssetImage(
                                              widget.image,
                                            ),
                                            minScale: PhotoViewComputedScale
                                                .contained,
                                            maxScale: PhotoViewComputedScale
                                                    .contained *
                                                4,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(dialogContex);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    height: size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.image,
                        ),
                      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.home.toString(),
                    style: homePage,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '(5.0)',
                          style: homePageSmall,
                        )
                      ],
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
                      newLike ? Icons.favorite_outlined : Icons.favorite_border,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: primary,
            ),
            //Hall details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hall Details',
                    style: homePage,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See more',
                            style: seeMorePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Booking price:     ',
                    style: homePageSmall,
                  ),
                  Text(
                    'Rs 20000',
                    style: homePageSmall,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Max capacity   :     ',
                    style: homePageSmall,
                  ),
                  Text(
                    '300 persons',
                    style: homePageSmall,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Opening time:       ',
                    style: homePageSmall,
                  ),
                  Text(
                    '09:00 Am',
                    style: homePageSmall,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Closing time:          ',
                    style: homePageSmall,
                  ),
                  Text(
                    '12:00 Am',
                    style: homePageSmall,
                  )
                ],
              ),
            ),
            Divider(
              color: primary,
            ),
            //address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Address:',
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
                    'Defence Phase 1, Adjacent PSO Pump, Near KPT InterchangeØŒ Defence View Housing Society, Karachi, Karachi City, Sindh 75500',
                    style: homePageSmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(
              color: primary,
            ),
            //about
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
            //slider
            Divider(
              color: primary,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Gallery:',
                    style: homePage,
                  )
                ],
              ),
            ),
            CarouselSlider(
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
            Divider(
              color: primary,
            ),
            //youtube
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Video:',
                    style: homePage,
                  )
                ],
              ),
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
            Divider(
              color: primary,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            //Button
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookService(
                      bname: widget.home,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: size.height * 0.06,
                width: size.width * 0.75,
                child: Center(
                  child: Text(
                    buttonText[0],
                    style: normWhite,
                  ),
                ),
              ),
            ),
            //   ],
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews',
                    style: homePage,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See more',
                            style: seeMorePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Wrap(
                children: List.generate(
                  name.length,
                  (index) => Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 15,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Container(
                          height: size.height * 0.23,
                          width: size.width * 1,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        name[index],
                                        style: normPrimary,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            rating[index],
                                            style: normPrimary,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 5),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        'This marriage lawn is excellent. We had an amazing experience here. Loved the decoration and arrangements a lot. We had a really good time here. The food was also amazing and the staff members were super professional and nice. Loved the venue!',
                                        style: homePageSmall,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
