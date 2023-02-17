import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> validForm(GlobalKey<FormState> formKey) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(
          state.copyWith(
            status: LoginStatus.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.failure),
      );
    }
  }
}
