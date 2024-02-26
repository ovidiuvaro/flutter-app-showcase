import 'package:luca/navigation/app_navigator.dart';
import 'package:luca/navigation/error_dialog_route.dart';
import 'package:luca/navigation/no_routes.dart';

class AppInitNavigator with NoRoutes, ErrorDialogRoute {
  AppInitNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
