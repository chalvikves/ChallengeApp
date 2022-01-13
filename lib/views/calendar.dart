import 'package:challengeapp/static/themes.dart';
import 'package:challengeapp/views/drawer.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';

class CaledarView extends StatefulWidget {
  const CaledarView({Key? key}) : super(key: key);

  @override
  _CaledarViewState createState() => _CaledarViewState();
}

class _CaledarViewState extends State<CaledarView> {
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      extendBodyBehindAppBar: false,
      drawer: drawerYes(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CalendarCarousel(
        firstDayOfWeek: 1,
        todayButtonColor: Colors.red,
        todayTextStyle: const TextStyle(
          color: Colors.white,
        ),
        headerTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          fontSize: 20.0,
        ),
        iconColor: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.black
            : Colors.white,
        weekendTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.red
              : Colors.redAccent,
        ),
        weekdayTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        daysTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        prevDaysTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.grey
              : Colors.grey[800],
        ),
        nextDaysTextStyle: GoogleFonts.jost(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.grey
              : Colors.grey[800],
        ),
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          if (day.day == 15) {
            return Center(
              child: Icon(
                Icons.local_airport,
                color: (day.weekday == 6 || day.weekday == 7)
                    ? (MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.red
                        : Colors.redAccent)
                    : (MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white),
              ),
            );
          } else if (day.day == 10) {
            return Center(
              child: Icon(Icons.check, color: Colors.blue),
            );
          } else {
            return null;
          }
        },
        onDayPressed: (DateTime date, List events) {
          setState(() {
            _currentDate = date;
          });
        },
        targetDateTime: _currentDate,
        selectedDateTime: _currentDate,
        selectedDayButtonColor: Colors.grey[350]!,
        selectedDayTextStyle: TextStyle(
            color: (_currentDate.weekday == 6 || _currentDate.weekday == 7)
                ? (MediaQuery.of(context).platformBrightness == Brightness.light
                    ? Colors.red
                    : Colors.redAccent)
                : Colors.black),
      ),
    );
  }
}
