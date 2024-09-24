import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kazi_core/kazi_core.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> with BaseCubit {
  EmployeesCubit(this._getUserUseCase, this._getUsersUseCase)
      : super(EmployeesState());

  final GetUserUseCase _getUserUseCase;
  final GetUsersUseCase _getUsersUseCase;

  Future<void> onInit([int? employeeId]) async {
    emit(state.copyWith(status: StateStatus.loading));
    var employees = <User>[];
    User? employee;

    if (employeeId != null) {
      employee = await _getEmployeeById(employeeId);

      if (employee == null) {
        return emit(state.copyWith(status: StateStatus.noData));
      }
    } else {
      employees = await _getEmployees();
    }

    return emit(
      state.copyWith(
        status: StateStatus.initial,
        employee: employee,
        employees: employees,
      ),
    );
  }

  Future<User?> _getEmployeeById(int id) async {
    try {
      return _getUserUseCase(id);
    } on AppError catch (error) {
      onAppError(error);
    } catch (error) {
      unexpectedError(error);
    }
    return null;
  }

  Future<List<User>> _getEmployees() async {
    try {
      return _getUsersUseCase(GetUsersParams(userType: UserType.employee));
    } on AppError catch (error) {
      onAppError(error);
    } catch (error) {
      unexpectedError(error);
    }

    return <User>[];
  }
}
