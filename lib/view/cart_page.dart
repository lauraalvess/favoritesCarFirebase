import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text("Carrinho"),
        ),
      ],
    );
  }
}
