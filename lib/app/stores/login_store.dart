import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool showPassword = false;
  @action
  void togglePassword() => showPassword = !showPassword;

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(value) => password = value;

  @observable
  bool loggedin = false;
  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedin = true;
    email = '';
    password = '';
  }

  @action
  void logout() => loggedin = false;

  @action
  Widget onError(e) => ErrorWidget(e);
  @action
  init() => loginPressed;

  @computed
  Function get loginPressed {
    return (isEmailValid && isPasswordValid && !loading) ? login : onError;
  }

  @computed
  bool get isPasswordValid => password.length >= 6;
  @computed
  bool get isEmailValid => email.length >= 6;
  @computed
  bool get isFormValid => isPasswordValid && isEmailValid;
}
