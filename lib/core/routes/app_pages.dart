import 'package:kazi_companies/core/routes/routes.dart';

enum AppPages {
  services(0),
  serviceDetails(0),
  addServices(1),
  servicesType(2),
  addServiceType(3),
  clients(4),
  employees(5),
  employeeDetails(5),
  addEmployee(6),
  updateEmployee(7),
  signIn(10),
  signUp(11),
  forgotPassword(12),
  resetPassword(13),
  privacyPolicy(14),
  privacyPolicyWebView(15);

  const AppPages(this.value);

  final int value;

  static AppPages fromIndex(int value) {
    for (AppPages page in AppPages.values) {
      if (page.value == value) {
        return page;
      }
    }

    return services;
  }

  static String getRoute(AppPages page, {int? id}) {
    switch (page) {
      case AppPages.services:
        return AppRoutes.services;
      case AppPages.addServices:
        return '${AppRoutes.services}/${AppRoutes.add}';
      case AppPages.serviceDetails:
        return '${AppRoutes.services}/$id';
      case AppPages.servicesType:
        return '${AppRoutes.services}/${AppRoutes.type}';
      case AppPages.addServiceType:
        return '${AppRoutes.services}/${AppRoutes.type}/${AppRoutes.add}';
      case AppPages.clients:
        return AppRoutes.clients;

      case AppPages.employees:
        return AppRoutes.employees;
      case AppPages.employeeDetails:
        return '${AppRoutes.employees}/$id';
      case AppPages.addEmployee:
        return AppRoutes.addEmployee;
      case AppPages.updateEmployee:
        return '${AppRoutes.updateEmployee}/$id';

      case AppPages.signIn:
        return AppRoutes.signIn;
      case AppPages.signUp:
        return AppRoutes.signUp;
      case AppPages.forgotPassword:
        return AppRoutes.forgotPassword;
      case AppPages.resetPassword:
        return '/${AppRoutes.resetPassword}';
      case AppPages.privacyPolicy:
        return AppRoutes.privacyPolicy;
      case AppPages.privacyPolicyWebView:
        return '${AppRoutes.privacyPolicy}/${AppRoutes.webView}';
    }
  }
}
