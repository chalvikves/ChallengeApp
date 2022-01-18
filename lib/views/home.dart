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
      //initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      onModelReady: (model) => model.initialise(),
      fireOnModelReadyOnce: true,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        ),
        extendBodyBehindAppBar: true,
        drawer: drawerYes(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 40.0, 40.0, 0.0),
              child: Center(
                child: Text(
                  model.currentChallenge.challenge!,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            const Spacer(),
            model.currentChallenge.state == ChallengeState.started
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
                      primary: Colors.blue[900],
                      fixedSize: const Size(170, 40),
                    ),
                  ),
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
            model.currentChallenge.state == ChallengeState.complete
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
