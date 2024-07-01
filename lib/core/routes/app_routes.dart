abstract class AppRoutes {
  //Main Routes
  static String initial = '/';
  static String services = '/services';
  static String clients = '/clients';

  static String employees = '/employees';
  static String addEmployee = '/employees/$add';
  static String updateEmployee = '/employees/$update';

  static String signIn = '/sign-in';
  static String signUp = '/sign-up';
  static String forgotPassword = '/forgot-password';
  static String privacyPolicy = '/privacy-policy';
  static String resetPassword = 'reset-password';

  //Sub Routes
  static String add = 'add';
  static String update = 'update';
  static String type = 'type';
  static String webView = 'web-view';
}
