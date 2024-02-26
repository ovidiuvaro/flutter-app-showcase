import 'package:luca/dependency_injection/app_component.dart';
import 'package:luca/features/auth/login/login_initial_params.dart';
import 'package:luca/features/auth/login/login_page.dart';
import 'package:luca/navigation/alert_dialog_route.dart';
import 'package:luca/navigation/app_navigator.dart';
import 'package:luca/navigation/error_dialog_route.dart';
import 'package:luca/navigation/no_routes.dart';

class LoginNavigator with NoRoutes, ErrorDialogRoute, AlertDialogRoute {
  LoginNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

//ignore: unused-code
mixin LoginRoute {
  Future<void> openLogin(LoginInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(getIt<LoginPage>(param1: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
