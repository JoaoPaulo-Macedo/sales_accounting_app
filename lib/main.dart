import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_page.dart';
import 'package:lucky_triangle/core/inject/inject.dart';
import 'package:lucky_triangle/core/utils/routes_name.dart';

void main() {
  Inject.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.initial,
      routes: {
        RoutesName.initial: (context) => const HomePage(),
      },
    );
  }
}
