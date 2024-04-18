// https://www.youtube.com/watch?v=cltCpXY60Sk

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/page/home_page.dart';
import '/provider/todos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Todo App';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: const Color(0xFFf6f5ee),
          ),
          home: const HomePage(),
        ),
      );
}
