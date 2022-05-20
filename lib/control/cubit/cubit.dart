import 'package:attendance/control/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';
import '../DioHelper.dart';
import '../end_points.dart';


class AttendanceCubit extends Cubit<AttendanceStates> {
  AttendanceCubit() : super(InitialState());

  static AttendanceCubit get(context) => BlocProvider.of(context);

UserModel? userModel;

  Future<void> getUsers()async{
emit(AttendanceLoadingState());
    await DioHelper.getData(url: getUser).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(userModel!.data![0].email);
      emit(AttendanceSuccessState(userModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(AttendanceErrorState(onError));
    });
  }

  Future<void> userTimeSheet(int id)async{
    emit(AttendanceTimeSheetLoadingState());
    await DioHelper.postData(url: timeSheet,data:  {
      'Student_id':id,
      'Course_id':2
    }).then((value) {
      print(id);
      print(value.data);
      emit(AttendanceTimeSheetSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(AttendanceTimeSheetErrorState(onError));
    });
  }

  Future<void> userAttend(int id)async{
    emit(AttendLoadingState());
    await DioHelper.postData(url: attend,data:  {

      'student_course_id':id
    }).then((value) {
print(id);
      print('--------------------------------------------------${value.data['success']}');
      emit(AttendSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(AttendErrorState(onError));
    });
  }

}