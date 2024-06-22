import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/app_shell.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/employees/pages/employee_details_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employees_page.dart';
import 'package:kazi_companies/presenter/initial/pages/splash_page.dart';
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
        pageBuilder: (context, state) => _customTransition(
          state,
          Container(color: Colors.amber),
          // ServiceLandingPage(showOnboarding: AppRouter.showOnboarding),
        ),
      ),
      GoRoute(
        path: AppRoutes.clients,
        pageBuilder: (context, state) => _customTransition(
          state,
          // HomePage(showOnboarding: AppRouter.showOnboarding),
          Container(color: Colors.red),
        ),
      ),
      GoRoute(
        path: AppRoutes.employees,
        builder: (context, state) => EmployeesPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) =>
                EmployeeDetailsPage(id: (state.extra as RouteParams).id!),
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
}
