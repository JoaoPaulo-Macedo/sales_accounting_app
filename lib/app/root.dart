import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/root_controller.dart';
import 'pages/home/home_page.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Difference ValueListenableBuilder, StreamBuilder, HeritedWidget
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: RootController.instance.themeController.themeMode, //Change the notifier
      builder: (context, value, child) {
        if (value == null) return Container();

        ThemeMode themeMode = ThemeMode.system;
        if (value == ThemeMode.light)
          themeMode = ThemeMode.light;
        else if (value == ThemeMode.dark) themeMode = ThemeMode.dark;

        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey,
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),
          home: HomePage(title: 'ACERTO DE VENDAS'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
