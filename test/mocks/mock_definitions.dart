import 'package:bloc_test/bloc_test.dart';
import 'package:luca/core/domain/model/user.dart';
import 'package:luca/core/domain/stores/user_store.dart';
import 'package:luca/core/utils/current_time_provider.dart';
import 'package:luca/core/utils/debouncer.dart';
import 'package:luca/core/utils/periodic_task_executor.dart';
//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

import 'package:luca/navigation/app_navigator.dart';
import 'package:mocktail/mocktail.dart';

class MockAppNavigator extends Mock implements AppNavigator {}

// MVP

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES

//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
class MockUserStore extends MockCubit<User> implements UserStore {}
//DO-NOT-REMOVE STORES_MOCK_DEFINITION

class MockDebouncer extends Mock implements Debouncer {}

class MockPeriodicTaskExecutor extends Mock implements PeriodicTaskExecutor {}

class MockCurrentTimeProvider extends Mock implements CurrentTimeProvider {}
