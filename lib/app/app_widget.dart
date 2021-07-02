import 'package:flutter/material.dart';
import 'package:poc_mobx_leonardo/app/stores/login_store.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepPurpleAccent,
            selectionHandleColor: Colors.deepPurpleAccent,
          ),
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
