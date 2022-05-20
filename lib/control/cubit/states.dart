


import 'package:attendance/model/attend_model.dart';

import '../../model/user_model.dart';

abstract class AttendanceStates{}

class InitialState extends AttendanceStates{}
class AttendanceLoadingState extends AttendanceStates{}
class AttendanceSuccessState extends AttendanceStates{
  final UserModel userModel;

  AttendanceSuccessState(this.userModel);
}
class AttendanceErrorState extends AttendanceStates{
  final String error;

  AttendanceErrorState(this.error);
}


class AttendanceTimeSheetLoadingState extends AttendanceStates{}
class AttendanceTimeSheetSuccessState extends AttendanceStates{

}
class AttendanceTimeSheetErrorState extends AttendanceStates{
  final String error;

  AttendanceTimeSheetErrorState(this.error);
}


class AttendLoadingState extends AttendanceStates{}
class AttendSuccessState extends AttendanceStates{
final AttendModel attendModel;

  AttendSuccessState(this.attendModel);

}
class AttendErrorState extends AttendanceStates{
  final String error;

  AttendErrorState(this.error);
}