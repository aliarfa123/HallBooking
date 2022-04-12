import 'package:banquet_booking/banquets/banquetsDetail.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class SeeMore extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _SeeMoreState createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  List name = [
    'Fezan Banquet Karimabad',
    'Asad Banquet Defence',
    'Umar Banquet North Nazimabad',
    'Hamza Banquet DHA',
    'Hassan Banquet Gulshan',
    'Ali Banquet Gulustan e johar',
  ];
  List image = [
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall3.jpg',
    'assets/images/hall1.jpg',
    'assets/images/hall2.jpg',
    'assets/images/hall3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Benquets',
          style: TextStyle(
            color: white,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        backgroundColor: primary,
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
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                // width: MediaQuery.of(context).size.width * 0.9,
                // height: double.infinity,
                child: Wrap(
                  children: List.generate(
                    image.length,
                    (index) => Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
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
                              width: MediaQuery.of(context).size.width * 0.43,
                              height: MediaQuery.of(context).size.height * 0.3,
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
                                    width: size.width * 0.45,
                                    height: size.height * 0.2,
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
                                  Container(
                                    width: size.width * 0.45,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, bottom: 2, left: 5),
                                          child: Text(
                                            name[index],
                                            textAlign: TextAlign.start,
                                            style: banquetName,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 2,
                                              left: 10,
                                              right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                              Text(
                                                '(4.5)',
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
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
          ],
        ),
      ),
    );
  }
}
