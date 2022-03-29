import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/models/cart.dart';
import 'package:state_management_demo/models/product.dart';
import 'package:state_management_demo/screens/cartpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product(title: "Apple", price: 40),
    Product(title: "Banana", price: 40),
    Product(title: "orange", price: 40),
    Product(title: "mango", price: 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Shopping Cart'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_basket),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                      ),
                      Text(cart.count.toString())
                    ],
                  ),
                )
              ],
            ),
            body: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index].title),
                    subtitle: Text(products[index].price.toString()),
                    trailing: Icon(Icons.add),
                    onTap: () {
                      cart.add(products[index]);
                    },
                  );
                }));
      },
    );
  }
}
