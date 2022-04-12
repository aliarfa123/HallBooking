import 'package:banquet_booking/banquets/banquetsDetail.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  List name = [
    'Abdullah',
    'Umar',
    'Ali',
    'Hassan',
    'Hamza',
    'Lareb',
  ];
  List Rating = [
    '4.5',
    '4',
    '5',
    '4.5',
    '4',
    '5',
  ];
  String review =
      'This marriage lawn is excellent. We had an\namazing experience here. Loved the decoration and arrangements a lot. We had a really good time here. The food was also amazing and the staff members were super professional and nice. Loved the venue!';
  // List review = [
  //   'This marriage lawn is excellent. We had an amazing experience here. Loved the decoration and arrangements a lot. We had a really good time here. The food was also amazing and the staff members were super professional and nice. Loved the venue!',
  // ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Reviews',
          style: pageTitle,
        ),
      ),
      body: Container(
        width: size.width,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Add Your Review Here'),
                            ],
                          ),
                          actions: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 30,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Add your review',
                                    ),
                                    // keyboardType: TextInputType.multiline,
                                    minLines: 2,
                                    maxLines: 5,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlatButton(
                                      color: primary,
                                      onPressed: () {},
                                      child: Text(
                                        'Add',
                                        style: normWhite,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      });
                }),
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(108, 2, 42, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add review',
                        style: pageTitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                // width: MediaQuery.of(context).size.width * 0.9,
                // height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Wrap(
                    children: List.generate(
                      name.length,
                      (index) => Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 15, right: 15, bottom: 0),
                            child: Container(
                              height: size.height * 0.23,
                              width: size.width * 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                          bottom: 5),
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
                                                Rating[index],
                                                style: normPrimary,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                          bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'This marriage lawn is excellent. We had an\namazing experience here. Loved the decoration\nand arrangements a lot. We had a really good\ntime here. The food was also amazing and the\nstaff members were super professional and \nnice. Loved the venue!',
                                            style: normPrimary,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
