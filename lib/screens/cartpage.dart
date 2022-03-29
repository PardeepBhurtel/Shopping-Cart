import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/models/cart.dart';
import 'package:state_management_demo/screens/checkpage.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart Page'),
        ),
        body: cart.count == 0
            ? Center(
                child: Text('No any item in a cart'),
              )
            : ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(cart.basketItems[index].title),
                      subtitle: Text(cart.basketItems[index].price.toString()),
                      trailing: Icon(Icons.delete),
                      onTap: () {
                        cart.remove(cart.basketItems[index]);
                      },
                    ),
                  );
                },
              ),
        bottomNavigationBar: Container(
          height: 40,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text('Total cost:'),
                      Text('RS' + cart.total.toString())
                    ],
                  ),
                ),
                RaisedButton(
                    child: Text("check out"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CheckPage()));
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
