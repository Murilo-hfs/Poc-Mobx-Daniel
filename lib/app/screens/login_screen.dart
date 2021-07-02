import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_mobx_leonardo/app/screens/list_screen.dart';
import 'package:poc_mobx_leonardo/app/stores/login_store.dart';
import 'package:poc_mobx_leonardo/app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ReactionDisposer? disposer;
  LoginStore? loginStore;

  @override
  void didChangeDependencies() {
    loginStore = Provider.of<LoginStore>(context);
    super.didChangeDependencies();
    disposer = reaction(
      (_) => loginStore!.loggedin,
      (loggedIn) {
        if (loggedIn = true)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => ListScreen()),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                Observer(
                  builder: (_) => CustomTextField(
                    hint: "E-mail",
                    prefix: Icon(Icons.account_circle),
                    textInputType: TextInputType.emailAddress,
                    onChanged: loginStore!.setEmail,
                    enabled: !loginStore!.loading,
                  ),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) => CustomTextField(
                    hint: "Senha",
                    obscure: !loginStore!.showPassword,
                    prefix: Icon(Icons.lock),
                    onChanged: loginStore!.setPassword,
                    enabled: !loginStore!.loading,
                    suffix: IconButton(
                      splashRadius: 32.0,
                      icon: loginStore!.showPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: loginStore!.togglePassword,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) => SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      child: loginStore!.loading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Login'),
                      onPressed: loginStore!.login,
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

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }
}
