import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../control/cubit/cubit.dart';
import '../../control/cubit/states.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class UserDetails extends StatelessWidget {
  int index;
  AttendanceCubit cubit;

  UserDetails(this.index, this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: getRegularStyle(
              fontSize: FontSize.s16, color: ColorManager.primary),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: ColorManager.primary,
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ConditionalBuilder(
          condition: cubit.userModel != null ,
          builder: (context){
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: media.height / 3,
                  width: media.width,
                  decoration: BoxDecoration(color: ColorManager.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${cubit.userModel!.data![index].name}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ColorManager.black),
                      ),
                      Text(
                        '${cubit.userModel!.data![index].email}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ColorManager.black, fontSize: 20),
                      ),
                      Text(
                        '${cubit.userModel!.data![index].phone}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ColorManager.black, fontSize: 20),
                      ),
                      Text(
                        'Days:${cubit.userModel!.data![index].attendanceTimes}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ColorManager.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                BlocProvider(
                  create: (context) => AttendanceCubit()
                    ..userTimeSheet(cubit.userModel!.data![index].id!),
                  child: BlocConsumer<AttendanceCubit, AttendanceStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: media.height,
                          width: media.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: ColorManager.primary),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
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
                                      child: Icon(Icons.check,
                                          color: ColorManager.primary))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Day: 2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.white),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: 20,
                                      child: Icon(Icons.close, color: Colors.red))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days: 0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.white),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: 20,
                                      child: Icon(Icons.check,
                                          color: ColorManager.primary))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days: 0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.white),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: 20,
                                      child: Icon(Icons.check,
                                          color: ColorManager.primary))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days: 0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.white),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: 20,
                                      child: Icon(Icons.check,
                                          color: ColorManager.primary))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Days: 0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.white),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: 20,
                                      child: Icon(Icons.check,
                                          color: ColorManager.primary))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          fallback: (context)=>const Center(child: CircularProgressIndicator(),),

        ),
      ),
    );
  }

//description widget
}
