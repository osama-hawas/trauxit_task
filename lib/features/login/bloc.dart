import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_task/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final DioHelper dioHelper;
  LoginBloc(this.dioHelper) : super(LoginStates()) {
    on<LoginEvents>(_login);
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<void> _login(LoginEvents event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingStates());
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      emit(LoginSuccessStates());
    } else {
      emit(LoginFailedStates());
    }
  }
}
