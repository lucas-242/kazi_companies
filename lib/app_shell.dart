import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_design_system/themes/themes.dart';

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
  final menus = [
    'Calendar',
    'Services',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: KaziColors.background,
        child: ListView.separated(
          itemCount: menus.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(menus[index]),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (_) =>
            context.showLeftBottomSheet().then((shouldPop) => context.pop),
        child: Stack(
          children: [
            SizedBox(
              height: context.height - KaziSizings.bottomAppBarHeight,
              child: widget.child,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}