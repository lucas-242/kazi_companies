import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/domain/models/menu.dart';
import 'package:kazi_core/kazi_core.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final List<Menu> menus = [
    Menu(
      KaziLocalizations.current.services,
      KaziSvgAssets.services,
      AppPages.services,
    ),
    Menu(
      KaziLocalizations.current.clients,
      KaziSvgAssets.person,
      AppPages.clients,
    ),
    Menu(
      KaziLocalizations.current.employees,
      KaziSvgAssets.calculator,
      AppPages.employees,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: context.openDrawer,
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: KaziColors.background,
        child: Column(
          children: [
            KaziSpacings.verticalLg,
            Expanded(
              child: ListView.separated(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];
                  return ListTile(
                    title: Text(menu.name),
                    onTap: () {
                      context.navigateTo(menu.route);
                      context.closeDrawer();
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => context.showLeftBottomSheet().then(
          (_) {
            if (context.mounted) context.pop();
          },
        ),
        child: widget.child,
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
