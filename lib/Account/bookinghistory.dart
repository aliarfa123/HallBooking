import 'package:banquet_booking/theme/color.dart';
import 'package:flutter/material.dart';

class Bookinghistory extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _BookinghistoryState createState() => _BookinghistoryState();
}

class _BookinghistoryState extends State<Bookinghistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: primary,
            size: 25,
          ),
        ),
        toolbarHeight: 60.0,
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Booking History",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: primary),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: white,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 10,
            ),
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    'No detail available',
                    textAlign: TextAlign.left,
                    // style: customTitle,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
