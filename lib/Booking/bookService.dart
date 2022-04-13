import 'package:banquet_booking/theme/color.dart';
import 'package:banquet_booking/theme/textStyle.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  height: size.height * 0.62,
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
                                  _selectDate(context);
                                });
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "${selectedDate.toLocal()}"
                                    .split(' ')
                                    .first,
                              ),
                              keyboardType: TextInputType.datetime,
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
                                    value: items, child: Text(items));
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
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Guests',
                              ),
                              // keyboardType: TextInputType.multiline,
                              // minLines: ,
                              // maxLines: 5,
                            ),
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
                          Container(
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


// DatePicker.showTimePicker(context,
                                //     theme: const DatePickerTheme(
                                //       containerHeight: 210.0,
                                //     ),
                                //     showTitleActions: true, onConfirm: (_time) {
                                //   print(
                                //       'confirm ${_time.toString().split(' ').last}');
                                //   time =
                                //       '${_time.hour}:${_time.minute}:${_time.second}';
                                //   setState(() {
                                //     print(time);
                                //   });
                                // },
                                //     currentTime: DateTime.now(),
                                //     locale: LocaleType.en);
                                // setState(() {});