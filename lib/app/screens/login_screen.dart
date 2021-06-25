import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poc_mobx_leonardo/app/screens/list_screen.dart';
import 'package:poc_mobx_leonardo/app/stores/login_store.dart';
import 'package:poc_mobx_leonardo/app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginStore = LoginStore();
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment.center,
      margin: EdgeInsets.all(32),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 16,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hint: "E-mail",
                  prefix: Icon(Icons.account_circle),
                  textInputType: TextInputType.emailAddress,
                  onChanged: loginStore.setEmail,
                  enabled: true,
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) => CustomTextField(
                    hint: "Senha",
                    obscure: !loginStore.showPassword,
                    prefix: Icon(Icons.lock),
                    onChanged: loginStore.setPassword,
                    enabled: true,
                    suffix: IconButton(
                      splashRadius: 32.0,
                      icon: loginStore.showPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: loginStore.togglePassword,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) => SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: loginStore.isFormValid
                          ? () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ListScreen()),
                              );
                            }
                          : onError,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onError() {
    return SnackBar(
      content: Text('Erro ao preencher os campos!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
  }
}
