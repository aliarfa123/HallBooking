import 'package:banquet_booking/banquets/banquetsDetail.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List name = [
    'Banquet Karimabad',
    'Banquet Defence',
    'Banquet North Nazimabad',
  ];
  List image = [
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white70,
              primary.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primary,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          )
                        ],
                        color: white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: TextField(
                        cursorColor: primary,
                        style: TextStyle(color: primary),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              left: 0, right: 20, top: 10, bottom: 10),
                          icon: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.search,
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: double.infinity,
                    child: Wrap(
                      children: List.generate(
                        image.length,
                        (index) => Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BanquetsDetail(
                                              home: name[index],
                                              image: image[index],
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: primary.withOpacity(0.3),
                                  // ),
                                  color: white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.18,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            image[index],
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, bottom: 2, left: 10),
                                          child: Text(
                                            name[index],
                                            textAlign: TextAlign.start,
                                            style: homePage,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 2,
                                              left: 10,
                                              right: 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                              Text(
                                                '(4.5)',
                                                textAlign: TextAlign.right,
                                                style: homePageSmall,
                                              ),
                                            ],
                                          ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
