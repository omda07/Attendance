import 'package:flutter/material.dart';

import '../../control/cubit/cubit.dart';
import '../resources/color_manager.dart';

class AttendanceWidget extends StatelessWidget {
  int index;
  AttendanceCubit cubit;
   AttendanceWidget(this.index,this.cubit,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Day: 1',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: ColorManager.white),
        ),
        CircleAvatar(
            backgroundColor: ColorManager.white,
            radius: 20,
            child:

            Icon(Icons.check, color: ColorManager.primary))
      ],
    );
  }
}
