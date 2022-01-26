import 'package:challengeapp/services/api.dart';
import 'package:challengeapp/services/challenge_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  Api get api;
  @lazySingleton
  ChallengeService get challengeService;
  //NavigationService get navigationService;
  //@lazySingleton
  //DialogService get dialogService;
  //@lazySingleton
  //SnackbarService get snackbarService;
}

// Just run flutter packages pub run build_runner build to get the services