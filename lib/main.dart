import 'package:amaazon/constants/global_variables.dart';
import 'package:amaazon/providers/user_provider.dart';

import 'package:amaazon/router.dart';
import 'package:amaazon/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVaribales.secondaryColor),
          scaffoldBackgroundColor: GlobalVaribales.backgroundColor,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      home: const AuthScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
