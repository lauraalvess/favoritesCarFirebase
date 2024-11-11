import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        for (var pair in appState.favorites)
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: Text(pair),
            onTap: () {
              appState.removerFavorito(pair);
            },
          ),
      ],
    );
  }
}
