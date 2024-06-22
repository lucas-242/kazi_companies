import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/custom_user_data_table.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_design_system/kazi_design_system.dart';
import 'package:kazi_design_system/themes/themes.dart';

class EmployeesPage extends StatelessWidget {
  EmployeesPage({super.key});

  final employees = [
    User.toCreate(
      id: 1,
      name: 'Jupira Sem Dente',
      email: 'jupirinha_dentinho@test.com',
    ),
    User.toCreate(
      id: 2,
      name: 'Churusbengou',
      email: 'churusbengou@test.com',
    ),
    User.toCreate(
      id: 3,
      name: 'Churusbagou',
      email: 'churusbagou@test.com',
    ),
    User.toCreate(
      id: 4,
      name: 'Skkkkkkrrrruuuulll',
      email: 'skruuulll@test.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return KaziSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Colaboradores',
                style: KaziTextStyles.headlineMd,
              ),
              const KaziCircularButton(child: Icon(Icons.add)),
            ],
          ),
          KaziSpacings.verticalLg,
          CustomUserDataTable(
            data: employees,
            headers: const ['Nome', 'Email', 'Função'],
            onTap: (user) => context.navigateTo(
              AppPages.employeeDetails,
              id: user.id,
            ),
          ),
        ],
      ),
    );
  }
}
