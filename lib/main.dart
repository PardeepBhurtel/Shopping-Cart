import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/models/cart.dart';
import 'package:state_management_demo/screens/homepage.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'state_management',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
