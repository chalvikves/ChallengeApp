import 'package:challengeapp/global/locator.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CalendarViewModel extends BaseViewModel {
  final _challengeService = locator<ChallengeService>();

  int _streak = 0;
  int get streak => _streak;

  void getStreak() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _streak = _prefs.getInt('streak') ?? 0;
  }

  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  Challenge? get currentChallenge => _challengeService.currentChallenge;

  late EventList<Event> _eventList;
  EventList<Event> get eventList => _eventList;

  bool dayHasEvent = false;

  void init() {
    _challengeService.getCurrentChallenge();
    _eventList = markedDays();
    _title = '';
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
}
