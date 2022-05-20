import 'package:flutter/material.dart';


import '../../control/cubit/cubit.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../screens/user_details.dart';

class ItemBuilder extends StatelessWidget {
  int index;
AttendanceCubit cubit;
  ItemBuilder(

    this.index,
      this.cubit,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetails(index,cubit)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
           BoxShadow(
             offset: Offset(4.0,8.0),
            blurStyle: BlurStyle.inner,
             color: Colors.grey.shade200,
             blurRadius: 90.0
           )
          ],
            color: ColorManager.white, borderRadius: BorderRadius.circular(8),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${cubit.userModel!.data![index].name}',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                    color: ColorManager.black
                      ),
                ),
                Text(
                  '${cubit.userModel!.data![index].email}',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: FontSize.s16,                    color: ColorManager.grey
                  ),
                ),
              ],
            ),
            const Spacer(),
            CircleAvatar(
                radius: 20,
                backgroundColor: ColorManager.primary,
                child: Text(
                  '${cubit.userModel!.data![index].attendanceTimes}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.white, fontSize: FontSize.s18),
                )),

          ],
        ),
      ),
    );
  }
}
