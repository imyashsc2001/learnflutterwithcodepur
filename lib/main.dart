import 'package:flutter/material.dart';
import 'package:flutter_codepur/pages/home_page.dart';
import 'package:flutter_codepur/pages/login_page.dart';
import 'package:flutter_codepur/utils/routes.dart';
import 'package:flutter_codepur/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      theme: MyThemes.themeLight(context),
      darkTheme: MyThemes.themeDark(context),
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.routeLogin: (context) => const LoginPage(),
        MyRoutes.routeHome: (context) => const HomePage(),
      },
    );
  }
}
