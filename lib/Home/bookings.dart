import 'package:banquet_booking/theme/color.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: const Text('Booking Detail'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: primary,
            tabs: const <Widget>[
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Cancelled',
              ),
              Tab(
                text: 'In Progress',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Completed"),
            ),
            Center(
              child: Text("Cancelled"),
            ),
            Center(
              child: Text("In Progress"),
            ),
          ],
        ),
      ),
    );
  }
}
