import 'package:flutter/material.dart';
import './widgets/home.dart';
import './screens/settings_screen.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => HomePageWidget(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortener',
      theme: ThemeData(),
      home: HomePage(),
      routes: {
        '/database-display-page': (ctx) => DataBase(),
      },
    );
  }
}
