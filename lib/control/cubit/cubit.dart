import 'package:attendance/control/cubit/states.dart';
import 'package:attendance/model/attend_model.dart';
import 'package:attendance/model/time_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';
import '../DioHelper.dart';
import '../dio_exceptions.dart';
import '../end_points.dart';

class AttendanceCubit extends Cubit<AttendanceStates> {
  AttendanceCubit() : super(InitialState());

  static AttendanceCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> getUsers() async {
    emit(AttendanceLoadingState());
    await DioHelper.getData(url: getUser).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(userModel!.data![0].email);
      emit(AttendanceSuccessState(userModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(AttendanceErrorState(onError));
    });
  }
TimeSheetModel? timeSheetModel;
  Future<void> userTimeSheet(int id) async {
    emit(AttendanceTimeSheetLoadingState());
    await DioHelper.getData(
        url: timeSheet, queryParameters: {'Student_id': id, 'Course_id': 1}).then((value) {

      print(value.data);
      timeSheetModel = TimeSheetModel.fromJson(value.data);
      print('${timeSheetModel!.data}');
      emit(AttendanceTimeSheetSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AttendanceTimeSheetErrorState(onError.toString()));
    });
  }

  AttendModel? attendModel;
  String errorMessage = '';

  Future<void> userAttend(int id) async {
      emit(AttendLoadingState());
    await DioHelper.postData(url: attend, data: {'student_course_id': id})
        .then((value) {
      attendModel = AttendModel.fromJson(value.data);

      print(id);
      print(
          '--------------------------------------------------${attendModel!.message}');
      emit(AttendSuccessState(attendModel!));
    }).catchError((onError) {
      if (onError is DioError) {
        errorMessage = DioExceptions.fromDioError(onError).toString();

        print('Error attend Cubit ${onError.toString()}');
        print(errorMessage);
        emit(AttendErrorState(errorMessage));
      }
    });
  }
}
