import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        home: HomePage(),
        routes: {
          "/homePage":(_)=>new HomePage()
        },
      ),
    );
  }
}