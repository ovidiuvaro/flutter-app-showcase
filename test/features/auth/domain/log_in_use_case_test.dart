import 'package:flutter_test/flutter_test.dart';
import 'package:luca/core/utils/either_extensions.dart';
import 'package:luca/dependency_injection/app_component.dart';
import 'package:luca/features/auth/domain/use_cases/log_in_use_case.dart';

import '../../../mocks/mocks.dart';

void main() {
  late LogInUseCase useCase;

  setUp(() {
    useCase = LogInUseCase(Mocks.userStore);
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result =
          await useCase.execute(username: "test", password: "test123");

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test("getIt resolves successfully", () async {
    final useCase = getIt<LogInUseCase>();
    expect(useCase, isNotNull);
  });
}
