import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trauxit_task/core/logic/color_genrate.dart';
import 'package:trauxit_task/screens/login.dart';

import 'core/logic/kiwi.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light),
  );
  initKiwi();
  runApp(const TrauxitTask());
}

class TrauxitTask extends StatelessWidget {
  const TrauxitTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: MaterialApp(
           theme: ThemeData(
              fontFamily: 'Tajawal',
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: ColorsGenerate.from( Colors.black),
              hintColor: const Color(0xffA7A7A7),
             backgroundColor: Colors.white
            ),
            debugShowCheckedModeBanner: false,
            home: const LoginScreen() ,
          ),
        ),
      ),
    );
  }
}


