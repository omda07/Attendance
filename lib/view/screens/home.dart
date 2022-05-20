import 'package:attendance/control/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../control/cubit/states.dart';
import '../widgets/item_builder.dart';
import '../widgets/qr_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceCubit, AttendanceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AttendanceCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 100,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                "assets/images/applogo.png",
                // fit: BoxFit.cover,
              ),
            ),
            title: const Center(
                child: const Text(
              "All Students",
              style: const TextStyle(color: Colors.black),
            )),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QRViewExample()));
                  },
                  child: const Icon(
                    Icons.qr_code,
                    color: Colors.black,
                  ))
            ],
          ),
          body: SafeArea(
            child: ConditionalBuilder(
              condition: cubit.userModel !=null,
              builder: (context) => Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) => ItemBuilder(index,cubit),
                        // itemBuilder(context, value.backendUserModel!.users![index]),

                        itemCount: cubit.userModel!.data!.length,
                      ),
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}
