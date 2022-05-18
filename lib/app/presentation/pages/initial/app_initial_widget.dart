import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_accounting/app/presentation/pages/home/home_page.dart';
import 'package:sales_accounting/app/presentation/routes_name.dart';

class AppInitialWidget extends StatelessWidget {
  const AppInitialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Vendas',
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
