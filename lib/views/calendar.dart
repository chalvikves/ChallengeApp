import 'package:challengeapp/viewmodels/calendarViewModel.dart';
import 'package:challengeapp/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      viewModelBuilder: () => CalendarViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        ),
        extendBodyBehindAppBar: false,
        drawer: drawerYes(context),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          iconColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
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
              return const Center(
                child: Icon(Icons.check, color: Colors.blue),
              );
            } else {
              return null;
            }
          },
          onDayPressed: (DateTime date, List events) {
            model.setCurrentDate(date);
          },
          targetDateTime: model.currentDate,
          selectedDateTime: model.currentDate,
          selectedDayButtonColor: Colors.transparent, //Colors.grey[350]!,
          selectedDayBorderColor: Colors.pink,
          daysHaveCircularBorder: true,
          selectedDayTextStyle: TextStyle(
              color: (model.currentDate.weekday == 6 ||
                      model.currentDate.weekday == 7)
                  ? (MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.red
                      : Colors.redAccent)
                  : Colors.white),
        ),
      ),
    );
  }
}
