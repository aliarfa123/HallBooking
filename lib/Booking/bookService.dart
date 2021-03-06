import 'package:banquet_booking/Booking/calender.dart';
import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class BookService extends StatefulWidget {
  var bname;

  BookService({Key? key, required this.bname}); //: super(key: key);
  @override
  State<StatefulWidget> createState() => _BookServiceState(bname);
}

class _BookServiceState extends State<BookService> {
  var bname;

  _BookServiceState(bname);
  String dropdownvalue = 'Night';
  var items = [
    'Morning',
    'Night',
  ];
  var _maxGuest = 100;
  var perHead = 400;
  var total;

  TextEditingController _maxGuestControler = TextEditingController();

  // ****************************************************************************
  DateTime _currentDate = DateTime(2022, 4, 14);
  DateTime _currentDate2 = DateTime(2022, 4, 14);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2022, 4, 14));
  DateTime _targetDateTime = DateTime(2022, 4, 14);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    // child: Icon(
    //   Icons.person,
    //   color: Colors.amber,
    // ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2022, 4, 16): [
        Event(
          date: DateTime(2022, 4, 16),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        DateTime(2022, 4, 25),
        Event(
          date: DateTime(2022, 4, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2022, 4, 20),
        Event(
          date: DateTime(2022, 4, 20),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2022, 4, 20), [
      Event(
        date: DateTime(2022, 4, 20),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2022, 4, 21),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
//     final _calendarCarousel = CalendarCarousel<Event>(
//       onDayPressed: (date, events) {
//         this.setState(() => _currentDate = date);
//         events.forEach((event) => print(event.title));
//       },
//       weekendTextStyle: TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
// //          weekDays: null, /// for pass null when you do not want to render weekDays
//       headerText: 'Custom Header',
//       weekFormat: true,
//       markedDatesMap: _markedDateMap,
//       height: 200.0,
//       selectedDateTime: _currentDate2,
//       showIconBehindDayText: true,
// //          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
//       customGridViewPhysics: NeverScrollableScrollPhysics(),
//       markedDateShowIcon: true,
//       markedDateIconMaxShown: 2,
//       selectedDayTextStyle: TextStyle(
//         color: Colors.yellow,
//       ),
//       todayTextStyle: TextStyle(
//         color: Colors.blue,
//       ),
//       markedDateIconBuilder: (event) {
//         return event.icon ?? Icon(Icons.help_outline);
//       },
//       minSelectedDate: _currentDate.subtract(Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(Duration(days: 360)),
//       todayButtonColor: Colors.transparent,
//       todayBorderColor: Colors.green,
//       markedDateMoreShowTotal:
//           true, // null for not showing hidden events indicator
// //          markedDateIconMargin: 9,
// //          markedDateIconOffset: 3,
//     );

    /// Example Calendar Carousel without header and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Color.fromARGB(255, 84, 76, 175),
      onDayPressed: (date, events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.transparent,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: primary)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primary,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blueAccent,
      ),

      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.transparent,
      selectedDayTextStyle: TextStyle(
        color: black,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 190, 190, 190),
      ),
      inactiveDaysTextStyle: TextStyle(
        color: grey,
        fontSize: 16,
      ),
      selectedDayButtonColor: white,
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    // ****************************************************************************
    // @override
    // Widget build(BuildContext context) {
    total = _maxGuest * perHead;
    DateTime selectedDate = DateTime.now();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101),
          builder: (BuildContext context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: primary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          });
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Book Service',
          style: pageTitle,
        ),
      ),
      body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.bname.toString(),
                      style: banquetName,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: white,
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: const Offset(1, 1),
                        )
                      ],
                      color: white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: size.height * 0.7,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 15),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            Text(
                              'Select Date:',
                              style: banquetName,
                            ),
                            TextFormField(
                              onTap: () {
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  // _selectDate(context);
                                  //////////////////DATE DAILOG START////////////////////
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (BuildContext context) {
                                  //     return Expanded(
                                  //       child: AlertDialog(
                                  //         title: Text('Select Date'),
                                  //         actions: [
                                  //           Container(
                                  //             height: size.height * 0.7,
                                  //             width: size.width * 1,
                                  //             child: Column(
                                  //               // crossAxisAlignment:
                                  //               //     CrossAxisAlignment.start,
                                  //               // mainAxisAlignment:
                                  //               //     MainAxisAlignment.start,
                                  //               children: <Widget>[
                                  //                 Container(
                                  //                   margin: EdgeInsets.only(
                                  //                     top: 30.0,
                                  //                     bottom: 16.0,
                                  //                     left: 16.0,
                                  //                     right: 16.0,
                                  //                   ),
                                  //                   child: Row(
                                  //                     children: <Widget>[
                                  //                       Expanded(
                                  //                           child: Text(
                                  //                         _currentMonth,
                                  //                         style: TextStyle(
                                  //                           fontWeight:
                                  //                               FontWeight.bold,
                                  //                           fontSize: 20.0,
                                  //                         ),
                                  //                       )),
                                  //                       FlatButton(
                                  //                         child: Text('PREV'),
                                  //                         onPressed: () {
                                  //                           setState(() {
                                  //                             _targetDateTime = DateTime(
                                  //                                 _targetDateTime
                                  //                                     .year,
                                  //                                 _targetDateTime
                                  //                                         .month -
                                  //                                     1);
                                  //                             _currentMonth =
                                  //                                 DateFormat
                                  //                                         .yMMM()
                                  //                                     .format(
                                  //                                         _targetDateTime);
                                  //                           });
                                  //                         },
                                  //                       ),
                                  //                       FlatButton(
                                  //                         child: Text('NEXT'),
                                  //                         onPressed: () {
                                  //                           setState(() {
                                  //                             _targetDateTime = DateTime(
                                  //                                 _targetDateTime
                                  //                                     .year,
                                  //                                 _targetDateTime
                                  //                                         .month +
                                  //                                     1);
                                  //                             _currentMonth =
                                  //                                 DateFormat
                                  //                                         .yMMM()
                                  //                                     .format(
                                  //                                         _targetDateTime);
                                  //                           });
                                  //                         },
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   margin:
                                  //                       EdgeInsets.symmetric(
                                  //                           horizontal: 16.0),
                                  //                   child:
                                  //                       _calendarCarouselNoHeader,
                                  //                 ), //
                                  //               ],
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // );

                                  //////////////////DATE DAILOG END////////////////////
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Calander(),
                                  ),
                                );
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "${selectedDate.toLocal()}"
                                    .split(' ')
                                    .first,
                              ),
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.none,
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(
                              'Select Time:',
                              style: banquetName,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              elevation: 8,
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownvalue = newValue.toString();
                                });
                              },
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(
                              'Your Guests: (Max 500)',
                              style: banquetName,
                            ),
                            TextFormField(
                              controller: _maxGuestControler,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '$_maxGuest',
                              ),
                              keyboardType: TextInputType.phone,
                              // minLines: ,
                              // maxLines: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: _maxGuest.toDouble(),
                                    min: 1,
                                    max: 500,
                                    divisions: 100,
                                    activeColor: primary,
                                    inactiveColor: grey,
                                    label: '$_maxGuest',
                                    onChanged: (double newValue) {
                                      setState(() {
                                        // if (_maxGuestControler.text == '') {
                                        //   _maxGuest = newValue.round();
                                        //   _maxGuestControler.text =
                                        //       _maxGuest.toString();
                                        // } else {
                                        //   _maxGuestControler.text =
                                        //       newValue.toString();
                                        //   _maxGuest = newValue.round();
                                        // _maxGuest =
                                        //     _maxGuestControler.text as int;
                                        // }
                                        // _maxGuest =
                                        //     _maxGuestControler.text as int;
                                        _maxGuestControler.text =
                                            _maxGuest.toString();
                                        _maxGuest = newValue.round();
                                        // newValue =
                                        //     _maxGuestControler.text as double;
                                        total = perHead * _maxGuest;
                                      });
                                    },
                                    // semanticFormatterCallback:
                                    //     (double newValue) {
                                    //   return '${newValue.round()} dollars';
                                    // },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total: $perHead * $_maxGuest = $total',
                                  style: homePageSmall,
                                ),
                              ],
                            )
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(
                              'Description:',
                              style: banquetName,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Description',
                              ),
                              keyboardType: TextInputType.multiline,
                              minLines: 5,
                              maxLines: 10,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.square,
                                size: 20,
                                color: primary,
                              ),
                              const Text('Booked'),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Icon(
                                Icons.square,
                                size: 20,
                                color: grey,
                              ),
                              const Text('Available'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Book(
                        //               bname: widget.home,
                        //             )));
                      }),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: size.height * 0.055,
                            width: size.width * 0.3,
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: normPrimary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: size.height * 0.055,
                              width: size.width * 0.3,
                              child: Center(
                                child: Text(
                                  'Coustomer\nsuport',
                                  textAlign: TextAlign.center,
                                  style: normPrimary,
                                ),
                              ),
                            ),
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
    );
  }
}
