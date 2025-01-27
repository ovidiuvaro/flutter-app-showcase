import 'package:bloc/bloc.dart';
import 'package:luca/core/utils/bloc_extensions.dart';
import 'package:luca/core/utils/either_extensions.dart';
import 'package:luca/core/utils/mvp_extensions.dart';
import 'package:luca/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:luca/features/auth/login/login_navigator.dart';
import 'package:luca/features/auth/login/login_presentation_model.dart';
import 'package:luca/localization/app_localizations_utils.dart';

class LoginPresenter extends Cubit<LoginViewModel>
    with CubitToCubitCommunicationMixin<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel super.model,
    this.navigator,
    this.logInUseCase,
  );

  final LoginNavigator navigator;
  final LogInUseCase logInUseCase;

  LoginPresentationModel get _model => state as LoginPresentationModel;

  void onUsernameChanged(String text) {
    emit(
      _model.copyWith(
        username: text,
      ),
    );
  }

  void onPasswordChanged(String text) {
    emit(
      _model.copyWith(
        password: text,
      ),
    );
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await await logInUseCase
        .execute(username: username, password: password)
        .observeStatusChanges(
          (result) => emit(_model.copyWith(appLoginResult: result)),
        )
        .asyncFold(
          (fail) => navigator.showError(fail.displayableFailure()),
          (success) => navigator.showAlert(
            title: appLocalizations.logInSuccessTitle,
            message: appLocalizations.logInSuccessMessage,
          ),
        );
  }
}
