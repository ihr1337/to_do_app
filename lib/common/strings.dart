import 'package:intl/intl.dart';

abstract interface class AppStrings {
  static String get appName => Intl.message('To Do');

  static String get newToDoTitle => Intl.message('What must be done?');

  static String get add => Intl.message('Add');

  static String get cancel => Intl.message('Cancel');

  static String get ok => Intl.message('OK');
}
