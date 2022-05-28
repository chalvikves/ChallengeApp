import 'package:auto_route/auto_route.dart';
import 'package:challengeapp/global/router.gr.dart';
import 'package:challengeapp/viewmodels/calendarViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
      viewModelBuilder: () => CalendarViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          actions: [
            Container(
              height: double.minPositive,
              //padding: const EdgeInsets.only(top: 15),
              child:
                  Center(child: Text('5/${model.dayInMonth} days completed')),
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            'Awesome! You have a',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${model.streak}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            ' day streak',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_rounded,
                  color: Theme.of(context).focusColor,
                ),
                title:
                    Text('Home', style: Theme.of(context).textTheme.bodyText2),
                onTap: () => AutoRouter.of(context).push(const HomeView()),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.calendar_today_rounded,
                  color: Theme.of(context).focusColor,
                ),
                title: Text('Calendar',
                    style: Theme.of(context).textTheme.bodyText2),
                onTap: () => AutoRouter.of(context).pop(),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).focusColor,
                ),
                title: Text('Settings',
                    style: Theme.of(context).textTheme.bodyText2),
                onTap: () => AutoRouter.of(context).push(const SettingsView()),
              ),
              //const Spacer(),
              /*Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
                child: Column(
                  children: [
                    Text(
                      'If you like my work and want to support me press the button below <3',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => print('hi'),
                      child: const Text('Donate here <3'),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                    )
                  ],
                ),
              ),*/
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: CalendarCarousel<Event>(
                firstDayOfWeek: 1,
                todayButtonColor:
                    Colors.pink[300]!, //Colors.pink.withOpacity(0.2),
                todayBorderColor: Colors.transparent,
                todayTextStyle: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                markedDatesMap: model.eventList,
                markedDateShowIcon: true,
                markedDateIconBuilder: (event) {
                  return event.icon ?? Icon(Icons.gamepad);
                },
                headerTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20.0,
                ),
                iconColor: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                weekendTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.red
                      : Colors.redAccent,
                ),
                weekdayTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                daysTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                prevDaysTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.grey
                      : Colors.grey[800],
                ),
                nextDaysTextStyle: GoogleFonts.jost(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
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
                  var listOfKeys = model.eventList.events.keys.toList();
                  if (listOfKeys.any((element) =>
                      (element.day == day.day) &&
                      (element.month == day.month))) {
                    return const Text(
                      "",
                      style: TextStyle(color: Colors.transparent),
                    );
                  }
                },
                onDayPressed: (DateTime date, List<Event> events) {
                  model.setSelectedDate(date);
                  if (events.isNotEmpty) {
                    model.dayHasEvent = true;
                    model.descEvent(events.elementAt(0).title);
                  } else {
                    model.dayHasEvent = false;
                  }
                },
                targetDateTime: model.currentDate,
                selectedDateTime: model.selectedDate,
                selectedDayButtonColor: Colors.transparent, //Colors.grey[350]!,
                selectedDayBorderColor: Colors.pink[300]!,
                daysHaveCircularBorder: true,
                selectedDayTextStyle: GoogleFonts.jost(
                  color: (model.selectedDate?.weekday == 6 ||
                          model.selectedDate?.weekday == 7)
                      ? (MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.red
                          : Colors.redAccent)
                      : MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            model.dayHasEvent
                ? Card(
                    color: Theme.of(context).backgroundColor,
                    child: ListTile(
                      title: Text(
                        'Challenge done:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        model.title ?? '',
                        style: GoogleFonts.jost(
                            fontSize: 16, color: Colors.grey[600]),
                      ),
                      isThreeLine: true,
                      /*trailing: Column(
                        children: [
                          const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hard',
                            style: GoogleFonts.jost(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),*/
                    ),
                    margin: const EdgeInsets.all(10.0),
                    elevation: 5.0,
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
