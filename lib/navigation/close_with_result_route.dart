import 'package:luca/navigation/app_navigator.dart';

mixin CloseWithResultRoute<T> {
  AppNavigator get appNavigator;

  void closeWithResult(T? result) => appNavigator.closeWithResult(result);
}
