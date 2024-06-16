import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_design_system/kazi_design_system.dart';

extension RoutesExtensions on BuildContext {
  void navigateTo(
    AppPages page, {
    Service? service,
    String? token,
    WebViewParams? webViewParams,
  }) =>
      RoutesService.navigateTo(
        this,
        page,
        service: service,
        token: token,
        webViewParams: webViewParams,
      );

  void pushTo(
    AppPages page, {
    Service? service,
    String? token,
    WebViewParams? webViewParams,
  }) =>
      RoutesService.pushTo(
        this,
        page,
        service: service,
        token: token,
        webViewParams: webViewParams,
      );

  void navigateBack() => RoutesService.navigateBack(this);

  void navigateToAddServices([Service? service]) =>
      RoutesService.navigateToAddServices(this, service);

  void closeModal<T extends Object>([T? result]) => pop(result);

  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.error,
    bool hasBottomNavigation = true,
    bool horizontalMargin = true,
  }) =>
      showKaziSnackBar(
        this,
        message,
        horizontalMargin: horizontalMargin,
        hasBottomNavigation: hasBottomNavigation,
        type: type,
      );

  Future<bool?> showLeftBottomSheet() => showModalBottomSheet<bool>(
        context: this,
        useRootNavigator: true,
        builder: (context) => KaziBottomSheet(
          title: KaziLocalizations.current.leaveApp,
          backText: KaziLocalizations.current.back,
          onBack: () => context.closeModal(false),
          exitText: KaziLocalizations.current.exit,
          onClose: () {
            context.closeModal(true);
            context.navigateBack();
          },
        ),
      );
}
