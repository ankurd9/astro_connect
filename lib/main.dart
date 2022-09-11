import 'package:astro_connect/screens/screens.dart';
import 'package:astro_connect/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AstroConnectApp());
}

class AstroConnectApp extends StatelessWidget {
  const AstroConnectApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme().lightBase,
        darkTheme: AppTheme().darkBase,
        themeMode: ThemeMode.dark,
        title: 'AstroConnectApp',
        home: HomeScreen());
  }
}
