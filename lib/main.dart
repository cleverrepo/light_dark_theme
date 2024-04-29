import 'package:flutter/material.dart';
import 'package:light_dark_theme/state_management.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // dependency injection
      create: (_) => ThemeProvider()..initTheme(),
      child: Consumer<ThemeProvider>(
          builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // default theme for the device
          themeMode: value.isToggle ? ThemeMode.dark : ThemeMode.light,
          // our custom theme
          darkTheme: value.isToggle ? value.darkTheme : value.lightTheme,
          home: const Home(),
        );
      }),
    );
  }
}
