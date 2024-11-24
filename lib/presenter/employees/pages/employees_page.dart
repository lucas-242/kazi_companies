import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/core/components/custom_user_table.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeesCubit>().onInit();

    return BlocBuilder<EmployeesCubit, EmployeesState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => state.when(
        onState: () => KaziSafeArea(
          child: LayoutBuilder(
            builder: (context, size) {
              return SingleChildScrollView(
                child: Container(
                  width: size.maxWidth,
                  height: size.maxHeight,
                  constraints: const BoxConstraints(minHeight: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            KaziLocalizations.current.employees,
                            style: KaziTextStyles.headlineMd,
                          ),
                          KaziCircularButton(
                            child: const Icon(Icons.add),
                            onTap: () =>
                                context.navigateTo(AppPages.addEmployee),
                          ),
                        ],
                      ),
                      KaziSpacings.verticalLg,
                      CustomUserTable(
                        data: state.employees,
                        onTap: (user) => context.navigateTo(
                          AppPages.employeeDetails,
                          id: user.id,
                        ),
                        onEdit: (user) => context.navigateTo(
                          AppPages.updateEmployee,
                          id: user.id,
                        ),
                        onDelete: (user) =>
                            context.showSnackBar('Usuário Deletado'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        onLoading: () => const KaziLoading(),
      ),
    );
  }
}
