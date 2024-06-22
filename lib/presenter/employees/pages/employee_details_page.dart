import 'package:flutter/material.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_design_system/kazi_design_system.dart';
import 'package:kazi_design_system/themes/settings/kazi_spacings.dart';

class EmployeeDetailsPage extends StatelessWidget {
  EmployeeDetailsPage({super.key, required this.id});
  final int id;
  final user = User.toCreate(
    name: 'Jupira Sem Dente',
    email: 'jupirinha_dentinho@test.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KaziSafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(),
                Text(user.name),
                KaziSpacings.verticalMd,
                Text(user.email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
