import 'package:bloc/bloc.dart';
import 'package:kazi_companies/core/routes/routes.dart';

class AppCubit extends Cubit<AppPages> {
  AppCubit() : super(AppPages.services);

  void changePage(AppPages newPage) => emit(newPage);
}
