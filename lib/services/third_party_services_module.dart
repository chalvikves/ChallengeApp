import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  //@lazySingleton
  //DialogService get dialogService;
  //@lazySingleton
  //SnackbarService get snackbarService;
}

// Just run flutter packages pub run build_runner build to get the services