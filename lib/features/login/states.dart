part of 'bloc.dart';

class LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {

  LoginSuccessStates() {
    showMSG(message: "تم تسجيل الدخول بنجاح");
  }
}

class LoginFailedStates extends LoginStates {

  LoginFailedStates() {
    showMSG(message: "حقل البريد و كلمة المرور مطلوبين");
  }
}
