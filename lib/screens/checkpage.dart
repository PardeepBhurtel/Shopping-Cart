import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/models/cart.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Check your price"),
        ),
        body:
            Center(child: Text("you have to pay Rs:" + cart.total.toString())),
      );
    });
  }
}
