import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/presenter/employees/components/address_section.dart';
import 'package:kazi_companies/presenter/employees/components/contact_section.dart';
import 'package:kazi_companies/presenter/employees/components/personal_section.dart';
import 'package:kazi_companies/presenter/employees/components/services_section.dart';
import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({
    super.key,
    this.id,
    required this.viewState,
  });
  final int? id;
  final ViewState viewState;

  @override
  Widget build(BuildContext context) {
    context.read<EmployeesCubit>().onInit(employeeId: id);

    final padding = EdgeInsets.only(
      left: context.width * 0.02 + KaziInsets.sm,
      right: KaziInsets.md,
    );

    return Scaffold(
      body: KaziSafeArea(
        child: BlocBuilder<EmployeesCubit, EmployeesState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) => state.when(
            onState: () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalSection(
                    padding: padding,
                    user: state.employee,
                    isForm: viewState != ViewState.read,
                  ),
                  ContactSection(
                    padding: padding,
                    user: state.employee,
                    isForm: viewState != ViewState.read,
                  ),
                  AddressSection(
                    padding: padding,
                    user: state.employee,
                    isForm: viewState != ViewState.read,
                  ),
                  ServicesSection(
                    padding: padding,
                    user: state.employee,
                    isForm: viewState != ViewState.read,
                  ),
                ],
              ),
            ),
            onLoading: () => const KaziLoading(),
            onNoData: () =>
                const Center(child: KaziNoData(message: 'No user found')),
          ),
        ),
      ),
    );
  }
}
