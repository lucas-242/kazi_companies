part of 'employees_cubit.dart';

final class EmployeesState extends BaseState with EquatableMixin {
  EmployeesState({
    super.status = StateStatus.loading,
    super.callbackMessage,
    super.viewState,
    this.employees = const [],
    this.employee,
  });

  final List<User> employees;
  final User? employee;
  @override
  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        employees,
        employee,
        viewState,
      ];

  @override
  EmployeesState copyWith({
    StateStatus? status,
    String? callbackMessage,
    ViewState? viewState,
    List<User>? employees,
    User? employee,
  }) =>
      EmployeesState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        viewState: viewState ?? this.viewState,
        employees: employees ?? this.employees,
        employee: employee ?? this.employee,
      );
}
