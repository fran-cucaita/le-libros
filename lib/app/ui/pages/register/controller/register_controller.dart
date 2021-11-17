import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:le_libros/app/domain/inputs/sign_up.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';
import 'register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);

  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.i.find<SignUpRepository>();

  Future<SignUpResponse> submit() {
    return _signUpRepository.register(SignUpData(
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        password: state.password));
  }

  void OnNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void OnLastNameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void OnEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void OnPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void OnVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}
