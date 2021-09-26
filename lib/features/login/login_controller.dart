import 'package:avaliacao_framework_shop/features/home/home_screen.dart';
import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String email = 'framework@gmail.com';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != '' && email.isEmailValid();

  String? get emailError =>
      email == '' || emailValid ? null : 'E-mail inválido';

  @observable
  String password = '123456';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != '' && password.length >= 5;

  String? get passwordError =>
      password == '' || passwordValid ? null : 'Senha inválida';

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  String? error;

  @action
  Future<void> login(BuildContext context) async {
    setLoading(true);
    error = null;

    try {
      Navigator.of(context).push(MaterialPageRoute(
          settings: const RouteSettings(name: "/home"),
          builder: (context) => HomeScreen()));
    } catch (e) {
      error = e.toString();
    }

    setLoading(false);
  }
}
