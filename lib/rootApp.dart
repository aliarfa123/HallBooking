import 'package:banquet_booking/Home/homepage.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const Center(child: Text('asds')),
      const Center(
        child: Text('asds'),
      ),
      const Center(
        child: Text('asds'),
      ),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      Icons.home,
      Icons.payment,
      Icons.adb_outlined,
      Icons.person,
    ];
    List textItems = ["Home", "Orders", "Banquets", "Account"];
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: primary.withOpacity(0.1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(
                      bottomItems[index],
                      color: pageIndex == index ? primary : Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: pageIndex == index ? primary : Colors.grey,
                      ),
                    ),
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
