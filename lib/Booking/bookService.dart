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
                  height: size.height * 0.45,
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
                            TextFormField(
                              onTap: () {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Time',
                              ),
                              keyboardType: TextInputType.datetime,
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Description',
                              ),
                              keyboardType: TextInputType.multiline,
                              minLines: 5,
                              maxLines: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        child: Center(
                          child: Text(
                            'Book',
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
