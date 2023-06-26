/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_customized_clean_calendar/flutter_customized_clean_calendar.dart';
import 'package:flutter_customized_clean_calendar/orderTooltip.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<OrderTooltip> tooltips = [
    OrderTooltip(
      date: 1652186801810,
      message:
      "Next day deliveryies and all days later to that are cheaper than same-day delivery",
      price: "75",
      pillColor: "ff9800",
      pillBg: "ffb74d",
      title: "Next day",
    ),
    OrderTooltip(
        date: 1652043600000,
        message: 'Get your product with in 24 hours',
        price: "90",
        pillColor: "f44336",
        pillBg: "e57373",
        title: "Same day"),
    OrderTooltip(
        date: 1652389200000,
        message: 'Get your product with in 24 hours',
        price: "90",
        pillColor: "3399ff",
        pillBg: "e57373",
        title: "Other day"),
  ];
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    DateTime(2022, 05, 02): [
      CleanCalendarEvent(
        title: "Product Titlelkjhgfghjkllkjhv",
        date: "2020-06-01 12:05 AM",
        formerPrice: "5000 Birr",
        discountPrice: "3000 Birr",
        quantity: "1 items",
        status: "Delivering",
        image: Image.network("https://picsum.photos/200"),
      ),
      CleanCalendarEvent(
        title: "Product Title",
        date: "2020-06-01 12:05 AM",
        formerPrice: "5000 Birr",
        discountPrice: "3000 Birr",
        quantity: "1 items",
        status: "Pending",
        image: Image.network("https://picsum.photos/200"),
      ),
      CleanCalendarEvent(
        title: "Product Title",
        date: "2020-06-01 12:05 AM",
        formerPrice: "5000 Birr",
        discountPrice: "3000 Birr",
        quantity: "1 items",
        status: "Pending",
        image: Image.network("https://picsum.photos/200"),
      ),
    ],
    DateTime(2022, 05, 04): [
      CleanCalendarEvent(
        title: "Product Titlelkjhgfghjkllkjhv",
        date: "2020-06-01 12:05 AM",
        formerPrice: "5000 Birr",
        discountPrice: "3000 Birr",
        quantity: "1 items",
        status: "Delivering",
        image: Image.network("https://picsum.photos/200"),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    log(DateTime(2022, 05, 13).millisecondsSinceEpoch.toString());
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Calendar(
                        toolTips: tooltips,
                        onDateSelected: pickDate,
                        startOnMonday: true,
                        initialDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day + 1),
                        weekDays: const [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun'
                        ],
                        events: _events,
                        isExpandable: true,
                        eventDoneColor: Colors.blue,
                        selectedColor: Colors.orange[800],
                        todayColor: Colors.blue,
                        eventColor: Colors.black,
                        locale: 'en',
                        todayButtonText: 'Today',
                        isExpanded: true,
                        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                        dayOfWeekStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            */
/*ElevatedButton(
              child: const Text('Show Calendar'),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Calendar(
                                toolTips: tooltips,
                                onDateSelected: pickDate,
                                startOnMonday: true,
                                initialDate: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day + 1),
                                weekDays: const [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun'
                                ],
                                events: _events,
                                isExpandable: true,
                                eventDoneColor: Colors.blue,
                                selectedColor: Colors.orange[800],
                                todayColor: Colors.blue,
                                eventColor: Colors.black,
                                locale: 'en',
                                todayButtonText: 'Today',
                                isExpanded: true,
                                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                                dayOfWeekStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 11),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),*//*

          ],
        ),
      ),
    );
  }

  void pickDate(DateTime date) {
    if (date.isBefore(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)) ||
        date.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 14))) {
      print(date);
    }
  }
}*/
