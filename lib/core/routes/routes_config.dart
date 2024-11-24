import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/app_shell.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/clients/pages/clients_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employee_details_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employees_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employees_shell.dart';
import 'package:kazi_companies/presenter/initial/pages/splash_page.dart';
import 'package:kazi_companies/presenter/services/pages/services_page.dart';
import 'package:kazi_core/kazi_core.dart';

abstract class RoutesConfig {
  static final router = GoRouter(
    initialLocation: AppRoutes.initial,
    routes: [
      ..._initialRoutes,
      _appShellRoutes,
    ],
  );

  static final _initialRoutes = [
    GoRoute(
      path: AppRoutes.initial,
      pageBuilder: (context, state) =>
          _customTransition(state, const SplashPage()),
    ),
  ];

  static final _appShellRoutes = ShellRoute(
    builder: (context, state, child) => AppShell(child: child),
    routes: [
      GoRoute(
        path: AppRoutes.services,
        pageBuilder: (context, state) =>
            _customTransition(state, const ServicesPage()),
      ),
      GoRoute(
        path: AppRoutes.clients,
        pageBuilder: (context, state) =>
            _customTransition(state, const ClientsPage()),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            EmployeesShell(employeeId: _getId(state), child: child),
        routes: [
          GoRoute(
            path: AppRoutes.employees,
            builder: (context, state) => const EmployeesPage(),
          ),
          GoRoute(
            path: AppRoutes.addEmployee,
            builder: (context, state) =>
                const EmployeeDetailsPage(viewState: ViewState.create),
          ),
          GoRoute(
            path: '${AppRoutes.updateEmployee}/:id',
            builder: (context, state) => EmployeeDetailsPage(
              id: _getId(state),
              viewState: ViewState.update,
            ),
          ),
          GoRoute(
            path: '${AppRoutes.employees}/:id',
            builder: (context, state) => EmployeeDetailsPage(
              id: _getId(state),
              viewState: ViewState.read,
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<Widget> _customTransition(
    GoRouterState state,
    Widget child,
  ) {
    final Tween<Offset> bottomUpTween = Tween<Offset>(
      begin: const Offset(0.0, 0.25),
      end: Offset.zero,
    );
    final Animatable<double> fastOutSlowInTween =
        CurveTween(curve: Curves.fastOutSlowIn);
    final Animatable<double> easeInTween = CurveTween(curve: Curves.easeIn);

    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(bottomUpTween.chain(fastOutSlowInTween)),
          child: FadeTransition(
            opacity: easeInTween.animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  static int? _getId(GoRouterState state) =>
      int.tryParse(state.pathParameters.values.firstOrNull ?? '');
}
