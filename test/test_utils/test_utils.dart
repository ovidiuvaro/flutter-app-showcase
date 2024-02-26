import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:luca/core/helpers.dart';
import 'package:luca/core/utils/either_extensions.dart';
import 'package:luca/dependency_injection/app_component.dart';
import 'package:luca/localization/app_localizations_utils.dart';
import 'package:luca/main.dart';

import '../mocks/mocks.dart';

Future<Either<F, S>> successFuture<F, S>(S result) =>
    Future.value(success(result));

Future<Either<F, S>> failFuture<F, S>(F fail) => Future.value(failure(fail));

Future<void> prepareAppForUnitTests() async {
  isUnitTests = true;
  Mocks.init();
  notImplemented = ({message, context}) => doNothing();
  overrideAppLocalizations(AppLocalizationsEn());
  await configureDependenciesForTests();
}

Future<void> configureDependenciesForTests() async {
  await getIt.reset();
  configureDependencies();
}

Future<void> preparePageTests(FutureOr<void> Function() testMain) async {
  overrideAppLocalizations(AppLocalizationsEn());
  await loadAppFonts();
  await prepareAppForUnitTests();
  // ignore: do_not_use_environment
  const isCi = bool.fromEnvironment('isCI');

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        // ignore: avoid_redundant_argument_values
        enabled: !isCi,
      ),
    ),
    run: () async {
      return testMain();
    },
  );
}
