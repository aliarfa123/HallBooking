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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    // color: primary,
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.image.toString(),
                  ),
                )),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      like = !like;
                    });
                  },
                  child: Icon(
                    like ? Icons.favorite_outlined : Icons.favorite_border,
                    color: primary,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 22,
                  color: Colors.orange,
                ),
                Text(
                  '(4.0)',
                  style: homePage,
                ),
              ],
            ),
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
          // DefaultTabController(
          //   initialIndex: 0,
          //   length: 4,
          //   child: Column(
          //     children: [
          //       TabBar(
          //         indicatorColor: primary,
          //         tabs: [
          //           Tab(
          //             icon: Icon(Icons.cloud_outlined, color: primary),
          //           ),
          //           Tab(
          //             icon: Icon(
          //               Icons.beach_access_sharp,
          //               color: primary,
          //             ),
          //           ),
          //           Tab(
          //             icon: Icon(Icons.brightness_5_sharp, color: primary),
          //           ),
          //           Tab(
          //             icon: Icon(Icons.ac_unit_sharp, color: primary),
          //           ),
          //         ],
          //       ),

          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
