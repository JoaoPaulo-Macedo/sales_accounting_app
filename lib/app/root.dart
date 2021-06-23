import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/root_controller.dart';
import 'models/app_config.dart';
import 'pages/home/home_page.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Difference ValueListenableBuilder, StreamBuilder, HeritedWidget
    return ValueListenableBuilder<ThemeSwitch>(
      valueListenable: RootController.instance.changeTheme.theme,
      builder: (context, value, child) {
        if (value == null) return null;
        
        ThemeMode themeMode;
        if (value == ThemeSwitch.light) themeMode = ThemeMode.light;
        else if (value == ThemeSwitch.dark) themeMode = ThemeMode.dark;

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
