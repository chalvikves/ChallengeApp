import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class CalendarViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();
  late final Box box;

  int get streak => box.get('streak');

  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  Challenge? get currentChallenge => _challengeService.currentChallenge;

  late EventList<Event> _eventList;
  EventList<Event> get eventList => _eventList;

  bool dayHasEvent = false;

  late int? _dayInMonth;
  int? get dayInMonth => _dayInMonth;

  void init() {
    _challengeService.getCurrentChallenge();
    _eventList = markedDays();
    _title = '';
    box = Hive.box('challenge');
    _dayInMonth = daysInMonth(_currentDate.month, _currentDate.year);
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  late String? _title;
  String? get title => _title;

  void descEvent(String? e) {
    _title = e;
    notifyListeners();
  }

  EventList<Event> markedDays() {
    List<Challenge> dates = _challengeService.getChallenges();
    Iterable<Challenge> completed =
        dates.where((element) => element.state == ChallengeState.complete);
    /*Iterable<Challenge> started =
        dates.where((element) => element.state == ChallengeState.started);
    */
    List<Map<DateTime, Event>> completedList = [
      for (Challenge i in completed)
        {
          i.completeDate!: Event(
              date: i.completeDate!,
              title: i.challenge,
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ))
        }
    ];
    /*List<Map<DateTime, Event>> startedList = [
      for (Challenge i in started)
        {
          i.completeDate!: Event(
              date: i.completeDate!,
              title: i.challenge,
              icon: const Icon(
                Icons.check,
                color: Colors.blue,
              ))
        }
    ];*/
    EventList<Event> eventList = EventList<Event>(events: {
      DateTime(2022, 01, 25): [
        Event(
            date: DateTime(2022, 01, 25),
            icon: const Icon(
              Icons.check,
              color: Colors.blue,
            ))
      ]
    });

    for (var i in completed.toList()) {
      eventList.add(
        DateTime(
            i.completeDate!.year, i.completeDate!.month, i.completeDate!.day),
        Event(
          date: DateTime(
              i.completeDate!.year, i.completeDate!.month, i.completeDate!.day),
          title: i.challenge,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      );
    }
    eventList.add(
      DateTime(2022, 02, 27),
      Event(
          date: DateTime(2022, 02, 27),
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          description: 'hhthg'),
    );

    return eventList;
  }

  int? daysInMonth(int monthNum, int year) {
    List<int> monthLength = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }
    print(monthLength.elementAt(monthNum - 1));
    return monthLength.elementAt(monthNum - 1);
  }

  bool leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }
}
