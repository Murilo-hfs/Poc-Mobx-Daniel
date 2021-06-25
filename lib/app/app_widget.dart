import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
