import 'package:bloc/bloc.dart';
import 'package:flutter_demo/core/utils/mvp_extensions.dart';
import 'package:flutter_demo/features/auth/login/login_navigator.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';

class LoginPresenter extends Cubit<LoginViewModel>
    with CubitToCubitCommunicationMixin<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel super.model,
    this.navigator,
  );

  final LoginNavigator navigator;

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
}
