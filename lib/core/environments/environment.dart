import 'package:kazi_companies/core/constants/app_keys.dart';
import 'package:kazi_core/kazi_core.dart';

abstract interface class Environment {
  static EnvironmentValue get environmentValue => EnvironmentValue.fromString(
        String.fromEnvironment(
          AppKeys.environmentKey,
          defaultValue: EnvironmentValue.dev.value,
        ),
      )!;

  static Environment get instance => environmentValue == EnvironmentValue.dev
      ? DevEnvironment()
      : ProdEnvironment();

  String get kaziApiUrl;
  static String get policiesGooglePlayUrl =>
      'https://www.google.com/policies/privacy/';
  static String get policiesAdMobUrl =>
      'https://support.google.com/admob/answer/6128543?hl=en';
  static String get policiesFirebaseAnalyticsUrl =>
      'https://www.google.com/analytics/terms/';
  static String get policiesFirebaseCrashlyticsUrl =>
      'https://firebase.google.com/support/privacy/';
}

final class DevEnvironment implements Environment {
  @override
  String get kaziApiUrl => 'http://192.168.0.232:5005/api/';
}

final class ProdEnvironment implements Environment {
  @override
  String get kaziApiUrl => 'https://localhost:7250/';
}
