import 'package:auto_route/auto_route.dart';
import 'package:challengeapp/viewmodels/settingsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:challengeapp/global/router.gr.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
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
                onTap: () => AutoRouter.of(context).push(const CalendarView()),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).focusColor,
                ),
                title: Text('Settings',
                    style: Theme.of(context).textTheme.bodyText2),
                onTap: () => AutoRouter.of(context).pop(),
              ),
              const Spacer(),
              Padding(
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
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).cardColor,
                        blurRadius: 20.0,
                        offset: const Offset(0, 10))
                  ],
                  color: Theme.of(context).backgroundColor,
                ),
                padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                height: model.chooseDaySwitch ? 240 : 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('Settings:'),
                      TitleSwitch(
                        switchBool: model.challengeEachDaySwitch,
                        title: 'New challenge every day:',
                        onChanged: (val) => model.toggleChallengeDay(),
                      ),
                      TitleSwitch(
                        switchBool: model.chooseDaySwitch,
                        title: 'Choose days for a new challenge:',
                        onChanged: (val) => model.toggleChooseDay(),
                      ),
                      model.chooseDaySwitch
                          ? Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (String i in model.daysOfWeek)
                                    SizedBox(
                                      width: 40,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: model
                                                      .daysOfWeekChallenge[
                                                  model.daysOfWeek.indexOf(i)]
                                              ? Colors.blue
                                              : Colors.white,
                                          primary: model.daysOfWeekChallenge[
                                                  model.daysOfWeek.indexOf(i)]
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        onPressed: () => model.setDayOfWeek(i),
                                        child: Text(
                                          i,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                      TitleSwitch(
                        switchBool: model.challengeEachMonthSwitch,
                        title: 'New challenge every month:',
                        onChanged: (val) => model.toggleChallengeMonth(),
                      ),
                    ],
                  ),
                ),
              ),
              // NEXT CONTAINER
              //
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).cardColor,
                        blurRadius: 20.0,
                        offset: const Offset(0, 10))
                  ],
                  color: Theme.of(context).backgroundColor,
                ),
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('Types of challenges:'),
                      TitleSwitch(
                        switchBool: model.mindsetSwitch,
                        title: 'Mindset',
                        onChanged: (val) {
                          model.toggleMindset();
                        },
                      ),
                      TitleSwitch(
                        switchBool: model.healthSwitch,
                        title: 'Health',
                        onChanged: (val) => model.toggleHealth(),
                      ),
                      TitleSwitch(
                        switchBool: model.workoutSwitch,
                        title: 'Workout',
                        onChanged: (val) => model.toggleWorkout(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSwitch extends ViewModelWidget<SettingsViewModel> {
  TitleSwitch({
    Key? key,
    required this.switchBool,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  final bool switchBool;
  final String title;
  void Function(bool) onChanged;

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.jost(fontSize: 16.0),
        ),
        Switch(
          value: switchBool,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

/* 
* Challenge varje dag
* Challenge varje månad
*/
