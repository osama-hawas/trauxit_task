import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:trauxit_task/core/desgin/main_button.dart';
import 'package:trauxit_task/core/desgin/main_text_field.dart';
import 'package:trauxit_task/core/logic/helper_methods.dart';
import 'package:trauxit_task/features/login/bloc.dart';
import 'package:trauxit_task/screens/home/home_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = KiwiContainer().resolve<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 75.h,
          ),
          Image.asset(
            "assets/icons/png/logo.png",
            height: 150.w,
            width: 150.w,
          ),
          SizedBox(
            height: 48.h,
          ),
          Text(
            "Please login first",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          MainTextField(
            text: "email",
            prefixIcon: Icons.email_rounded,
            controller: bloc.emailController,
          ),
          MainTextField(
            text: "password",
            type: InputType.pass,
            prefixIcon: Icons.lock,
            controller: bloc.passController,
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocConsumer(
            listener: (context, state) {
              if (state is LoginSuccessStates) {
                navigateTo(context, route: const HomeNavView());
              }
            },
            bloc: bloc,
            builder: (context, state) {
              return MainButton(
                text: "Login",
                onPressed: () {
                  bloc.add(LoginEvent());
                },
                isLoading: state is LoginLoadingStates,
              );
            },
          ),
        ],
      ),
    );
  }
}
