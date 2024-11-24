import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kazi_core/kazi_core.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> with BaseCubit {
  EmployeesCubit(this._getUserUseCase, this._getUsersUseCase)
      : super(EmployeesState());

  final GetUserUseCase _getUserUseCase;
  final GetUsersUseCase _getUsersUseCase;

  Future<void> onInit({int? employeeId, bool fromCache = true}) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      var employees = state.employees;
      var employee = state.employee;

      if (employeeId != null) {
        employee = await _getEmployeeById(employeeId, fromCache);
      } else {
        employees = await _getEmployees(fromCache);
      }

      return emit(
        state.copyWith(
          status: StateStatus.initial,
          employee: employee,
          employees: employees,
        ),
      );
    } on AppError catch (error) {
      onAppError(error);
    } catch (error) {
      unexpectedError(error);
    }
  }

  Future<User?> _getEmployeeById(
    int employeeId, [
    bool fromCache = true,
  ]) async {
    if (!fromCache || state.employees.isEmpty) {
      return _getUserUseCase(employeeId);
    }

    final result = state.employees.where((e) => e.id == employeeId);

    if (result.isEmpty) {
      return _getUserUseCase(employeeId);
    }

    Log.info('Getting user from cache');
    return result.first;
  }

  Future<List<User>> _getEmployees([bool fromCache = true]) async {
    if (!fromCache || state.employees.isEmpty) {
      return _getUsersUseCase(GetUsersParams(userType: UserType.employee));
    }

    Log.info('Getting users from cache');
    return state.employees;
  }
}
