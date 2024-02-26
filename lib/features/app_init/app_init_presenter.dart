import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:luca/core/domain/model/user.dart';
import 'package:luca/core/domain/stores/user_store.dart';
import 'package:luca/core/domain/use_cases/app_init_use_case.dart';
import 'package:luca/core/utils/bloc_extensions.dart';
import 'package:luca/core/utils/either_extensions.dart';
import 'package:luca/core/utils/mvp_extensions.dart';
import 'package:luca/dependency_injection/app_component.dart';
import 'package:luca/features/app_init/app_init_navigator.dart';
import 'package:luca/features/app_init/app_init_presentation_model.dart';
import 'package:luca/features/auth/login/login_initial_params.dart';
import 'package:luca/features/auth/login/login_page.dart';
import 'package:luca/navigation/app_navigator.dart';

class AppInitPresenter extends Cubit<AppInitViewModel>
    with CubitToCubitCommunicationMixin<AppInitViewModel> {
  AppInitPresenter(
    AppInitPresentationModel super.model,
    this.navigator,
    this.appInitUseCase,
    this.userStore,
  ) {
    listenTo<User>(
      userStore,
      onChange: (user) => emit(_model.copyWith(user: user)),
    );
  }

  final AppInitNavigator navigator;
  final AppInitUseCase appInitUseCase;
  final UserStore userStore;

  AppInitPresentationModel get _model => state as AppInitPresentationModel;

  Future<void> onInit() async {
    await await appInitUseCase
        .execute()
        .observeStatusChanges(
          (result) => emit(_model.copyWith(appInitResult: result)),
        )
        .asyncFold(
          (fail) => navigator.showError(fail.displayableFailure()),
          (success) => navigator.appNavigator.pushReplacement(
            context: AppNavigator.navigatorKey.currentContext,
            materialRoute(getIt<LoginPage>(param1: const LoginInitialParams())),
          ),
        );
  }
}
