import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/controllers/app_controller.dart';
import 'pages/home/home_page.dart';

class MaterialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeSwitch>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, value, child) {
        ThemeMode themeMode;
        if (value == ThemeSwitch.light) themeMode = ThemeMode.light;
        else if (value == ThemeSwitch.dark) themeMode = ThemeMode.dark;

        print('$themeMode !!!!!!!!!!');

        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey,
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),
          themeMode: themeMode,
          home: HomePage(title: 'ACERTO DE VENDAS'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
