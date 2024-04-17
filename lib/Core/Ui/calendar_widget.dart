import 'dart:math';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final dynamic onDaySelected;
  final Map<DateTime, List> events;

  const CustomTableCalendar({
    super.key,
    required this.selectedDate,
    required this.onDaySelected,
    this.events = const {},
  });

  Color getRandomColor(dynamic percentage) {
    Random random = Random();

    // Generate random values for red, green, and blue components
    int red = random.nextInt(256); // 0-255
    int green = random.nextInt(256); // 0-255
    int blue = random.nextInt(256); // 0-255

    // Create a Color object with the random components
    Color randomColor = Color.fromRGBO(red, green, blue, percentage);

    return randomColor;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
          todayTextStyle: TextStyle(
              fontSize: 12,
              color: Colors.white),
          defaultTextStyle:
              TextStyle(fontSize: 12)),
      focusedDay: selectedDate,
      shouldFillViewport: true,
      firstDay: DateTime.utc(2010, 10, 20),
      lastDay: DateTime.utc(2040, 10, 20),
      locale: "ar",
      onDaySelected: onDaySelected,
      currentDay: selectedDate,
      daysOfWeekHeight: 30,
      rowHeight: 45,
      eventLoader: (day) {
        return events[day] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          for (DateTime d in events.keys) {
            if (day.day == d.day &&
                day.month == d.month &&
                day.year == d.year) {
              return Container(
                decoration: BoxDecoration(
                  color: getRandomColor(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
          }
          return null;
        },
      ),
      weekNumbersVisible: false,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
