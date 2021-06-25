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

  @computed
  bool get isPasswordValid => password.length >= 6;
  @computed
  bool get isEmailValid => email.length >= 6;
  @computed
  bool get isFormValid => isPasswordValid && isEmailValid;
}
