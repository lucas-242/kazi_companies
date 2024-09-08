import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kazi_core/kazi_core.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> with BaseCubit {
  EmployeesCubit() : super(EmployeesState());

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
      return await Future.value(
        _employeesMock.where((e) => e.id == id).firstOrNull,
      );
    } on AppError catch (error) {
      onAppError(error);
    } catch (error) {
      unexpectedError(error);
    }
    return null;
  }

  Future<List<User>> _getEmployees() async {
    try {
      return Future.value(_employeesMock);
    } on AppError catch (error) {
      onAppError(error);
    } catch (error) {
      unexpectedError(error);
    }

    return <User>[];
  }

  final _employeesMock = [
    User.toCreate(
      id: 1,
      name: 'Jupira Sem Dente',
      email: 'jupirinha_dentinho@test.com',
      role: 'Manicure',
    ),
    User.toCreate(
      id: 2,
      name: 'Churusbengou',
      email: 'churusbengou@test.com',
      role: 'Esteticista',
    ),
    User.toCreate(
      id: 3,
      name: 'Churusbagou',
      email: 'churusbagou@test.com',
      role: 'Esteticista',
    ),
    User.toCreate(
      id: 4,
      name: 'Skkkkkkrrrruuuulll',
      email: 'skruuulll@test.com',
      role: 'Cabeleleira',
    ),
  ];
}
