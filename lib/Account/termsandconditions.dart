import 'package:banquet_booking/theme/color.dart';
import 'package:flutter/material.dart';

class TandC extends StatefulWidget {
  // const History({Key? key}) : super(key: key);

  @override
  _TandCState createState() => _TandCState();
}

class _TandCState extends State<TandC> {
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
        elevation: 3,
        centerTitle: false,
        title: Text(
          "About us",
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
