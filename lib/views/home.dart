import 'package:auto_route/auto_route.dart';
import 'package:challengeapp/global/router.gr.dart';
import 'package:challengeapp/static/challenges.dart';
import 'package:challengeapp/viewmodels/homeViewModel.dart';
import 'package:challengeapp/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        ),
        extendBodyBehindAppBar: true,
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
                onTap: () => AutoRouter.of(context).pop(),
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
                onTap: () => AutoRouter.of(context).push(const SettingsView()),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 8,
                ),
                IconButton(
                  onPressed: () => print('test'),
                  icon: Icon(
                    Icons.help_outline,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      model.currentChallenge!.challenge!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            /*model.currentChallenge!.state == ChallengeState.started
                ? ElevatedButton(
                    onPressed: () => model.stop(),
                    child: const Text('Stop challenge'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
                      fixedSize: const Size(170, 40),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => model.start(),
                    child: const Text('Start challenge'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: const Size(170, 40),
                    ),
                  ),*/
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => model.newChallenge(),
              child: const Text('New challenge'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                fixedSize: const Size(170, 40),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            model.currentChallenge!.state == ChallengeState.complete
                ? ElevatedButton(
                    onPressed: () => null,
                    child: const Text('Completed!'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: const Size(170, 40),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => model.complete(),
                    child: const Text('Complete challenge'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      fixedSize: const Size(170, 40),
                    ),
                  ),
            const SizedBox(
              height: 60.0,
            )
          ],
        ),
      ),
    );
  }
}
