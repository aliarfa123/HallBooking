import 'package:banquet_booking/Account/Signout.dart';
import 'package:banquet_booking/Account/aboutus.dart';
import 'package:banquet_booking/Account/bookinghistory.dart';
import 'package:banquet_booking/Account/notifications.dart';
import 'package:banquet_booking/Account/privacypolicy.dart';
import 'package:banquet_booking/Account/profile.dart';
import 'package:banquet_booking/Account/promotion.dart';
import 'package:banquet_booking/Account/termsandconditions.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List title = [
    'Booking Orders',
    'Promotions',
    'Notifications',
    'About us',
    'Terms and Conditions',
    'Privacy Policy ',
    'Sign Out',
  ];
  List icon = [
    // Icons.home,
    Icons.receipt,
    Icons.phone_bluetooth_speaker,
    Icons.notifications,
    Icons.receipt,
    Icons.receipt,
    Icons.receipt,
    Icons.logout,
  ];
  List page = [
    // RootApp(),
    Bookinghistory(),
    Promotions(),
    Notifications(),
    Aboutus(),
    TandC(),
    Privacypolicy(),
    Signout(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text('Account'),
        //   centerTitle: true,
        //   backgroundColor: primary,
        // ),
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white70,
              primary.withOpacity(0.2),
            ],
            stops: [0.3, 1.1],
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 30, top: 10, bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: primary,
                        child: Icon(
                          Icons.person,
                          color: white,
                          size: 70,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 25, right: 20, bottom: 0),
                            child: Text(
                              'Think Soft',
                              style: homePage,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 20, right: 20, bottom: 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                              child: Text(
                                'View Profile',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => page[index]));
                      },
                      leading: Icon(
                        icon[index],
                        color: primary,
                        size: 30,
                      ),
                      title: Text(
                        title[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    ));
  }
}
