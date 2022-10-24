import 'package:flutter_demo/core/domain/model/displayable_failure.dart';

class AppLoginFailure implements HasDisplayableFailure {
  AppLoginFailure.unknown([this.cause]) : type = AppLoginFailureType.Unknown;

  final AppLoginFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case AppLoginFailureType.Unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'AppLoginFailure{type: $type, cause: $cause}';
}

enum AppLoginFailureType {
  Unknown,
}
