import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:firebasewebexample/view/favorites_page.dart';
import 'package:firebasewebexample/view/my_homepage_state.dart';
import 'package:firebasewebexample/view/todo_form_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const HOME = '/';
  static const TODOS_FORM = 'todos-form';
  static const TODOS_LIST = 'todos-list';
  //static const LOGIN = 'login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        //home: MyHomePage(),
        routes: {
          HOME: (context) => MyHomePage(),
          TODOS_FORM: (context) => TodoFormPage(),
          TODOS_LIST: (context) => FavoritePage(),
        },
      ),
    );
  }
}
