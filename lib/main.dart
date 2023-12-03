import 'package:flutter/material.dart';
import 'package:machine_test/utils/constants/theme_data/app_theme.dart';
import 'package:machine_test/view/home_page.dart';
import 'package:provider/provider.dart';
import 'controller/user_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserController())
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:AppTheme.appTheme,
        home: const UserList() ,
      ),
    );
  }
}
