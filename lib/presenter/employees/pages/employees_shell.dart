import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeesShell extends StatelessWidget {
  const EmployeesShell({super.key, required this.child, this.employeeId});
  final int? employeeId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeesCubit>(
      create: (_) {
        final cubit = ServiceLocator.get<EmployeesCubit>();
        cubit.onInit(employeeId: employeeId);
        return cubit;
      },
      child: child,
    );
  }
}
