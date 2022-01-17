import 'package:challengeapp/viewmodels/settingsViewModel.dart';
import 'package:challengeapp/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

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
        drawer: drawerYes(context),
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
                height: 200,
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
