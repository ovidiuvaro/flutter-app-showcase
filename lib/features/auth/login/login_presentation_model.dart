import 'package:dartz/dartz.dart';
import 'package:luca/core/domain/model/user.dart';
import 'package:luca/core/helpers.dart';
import 'package:luca/core/utils/bloc_extensions.dart';
import 'package:luca/features/auth/domain/model/log_in_failure.dart';
import 'package:luca/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : appLoginResult = const FutureResult.empty(),
        username = '',
        password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.appLoginResult,
    required this.username,
    required this.password,
  });

  final FutureResult<Either<LogInFailure, User>> appLoginResult;

  @override
  final String username;

  @override
  final String password;

  @override
  bool get isLoginEnabled =>
      validateUsername(username) && validatePassword(password);

  @override
  bool get isLoading => appLoginResult.isPending();

  LoginPresentationModel copyWith({
    FutureResult<Either<LogInFailure, User>>? appLoginResult,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      appLoginResult: appLoginResult ?? this.appLoginResult,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;

  bool get isLoginEnabled;

  String get username;

  String get password;
}
