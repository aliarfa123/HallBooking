import 'package:banquet_booking/Account/account.dart';
import 'package:banquet_booking/Home/browse.dart';
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
      Search(),
      const Center(
        child: Text('Categories'),
      ),
      const Account(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      Icons.home,
      Icons.search_rounded,
      Icons.category_rounded,
      Icons.person,
    ];
    List textItems = ["Home", "Browse", "Categories", "Account"];
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: primary.withOpacity(0.8),
        border: Border(
          top: BorderSide(
            width: 1,
            color: primary.withOpacity(0.1),
          ),
        ),
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [
        //     white,
        //     primary.withOpacity(0.2),
        //   ],
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      size: 27,
                      color: pageIndex == index ? primary : Colors.white70,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: pageIndex == index ? primary : Colors.white70,
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
