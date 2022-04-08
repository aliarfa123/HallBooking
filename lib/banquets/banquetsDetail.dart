import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class BanquetsDetail extends StatefulWidget {
  const BanquetsDetail({Key? key}) : super(key: key);

  @override
  State<BanquetsDetail> createState() => _BanquetsDetailState();
}

class _BanquetsDetailState extends State<BanquetsDetail> {
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
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
              color: primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: homePage,
                ),
                const Icon(
                  Icons.favorite_border,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 20,
                      color: primary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '1 Review',
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
          )
        ],
      ),
    );
  }
}
