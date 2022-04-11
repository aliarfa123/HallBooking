import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List image = [
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall3.jpg',
    // 'assets/images/hall4.jpg',
    // 'assets/images/hall5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            width: size.width * 0.9,
            // height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: primary,
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  )
                ],
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: TextField(
                style: TextStyle(color: primary),
                decoration: InputDecoration(
                  hintText: "Banquet name, Location name",
                  hintStyle: TextStyle(color: grey),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
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
        ],
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: double.infinity,
            decoration: BoxDecoration(
              color: white,
            ),
            child: Wrap(
              children: List.generate(
                image.length,
                (index) => Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             Searchdetails(name: 'Pizza')));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primary.withOpacity(0.3),
                          ),
                          color: white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(image[index])),
                                color: white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 2, left: 10),
                                  child: Text(
                                    'Hall $index',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: primary,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 2, left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 20,
                                      ),
                                      Text(
                                        '(4.5)',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: primary,
                                          fontSize: 15,
                                        ),
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
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 10, right: 10, top: 10, bottom: 5),
              //   child: InkWell(
              //     borderRadius: BorderRadius.circular(10),
              //     onTap: () {
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //         builder: (context) =>
              //       //             Searchdetails(name: 'Pizza')));
              //     },
              //     child: Container(
              //       width: MediaQuery.of(context).size.width * 0.4,
              //       height: MediaQuery.of(context).size.height * 0.17,
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: primary.withOpacity(0.3),
              //         ),
              //         color: primary,
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(15),
              //         ),
              //       ),
              //       child: Column(
              //         children: [
              //           Container(
              //             height: size.height * 0.12,
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   fit: BoxFit.cover,
              //                   image:
              //                       AssetImage('assets/images/hall1.jpg')),
              //               color: primary,
              //               borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(15),
              //                   topRight: Radius.circular(15)),
              //             ),
              //           ),
              //           Container(
              //             child: Padding(
              //               padding:
              //                   const EdgeInsets.only(top: 4, bottom: 2),
              //               child: Text(
              //                 'Pizza',
              //                 style: seeMore,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            )),
      ),
    );
  }
}
