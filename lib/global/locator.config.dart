// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../services/api.dart' as _i3;
import '../services/challenge_service.dart' as _i4;
import '../services/third_party_services_module.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.Api>(() => thirdPartyServicesModule.api);
  gh.lazySingleton<_i4.ChallengeService>(
      () => thirdPartyServicesModule.challengeService);
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  return get;
}

class _$ThirdPartyServicesModule extends _i6.ThirdPartyServicesModule {
  @override
  _i3.Api get api => _i3.Api();
  @override
  _i4.ChallengeService get challengeService => _i4.ChallengeService();
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
}
