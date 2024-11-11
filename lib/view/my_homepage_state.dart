import 'package:firebasewebexample/main.dart';
import 'package:firebasewebexample/view/cart_page.dart';
import 'package:firebasewebexample/view/favorites_page.dart';
import 'package:firebasewebexample/view/generator_page.dart';
import 'package:firebasewebexample/view/help_page.dart';
import 'package:firebasewebexample/view/products_page.dart';
import 'package:firebasewebexample/view/todo_form_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = ProductsPage();
        break;
      case 2:
        page = CartPage();
        break;
      case 3:
        page = HelpPage();
        break;
      case 4:
        page = FavoritePage();
        break;
      case 5:
        page = TodoFormPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  const NavigationRailDestination(
                    icon: Icon(Icons.sports_gymnastics_outlined),
                    label: Text('Perfil'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.add_shopping_cart_sharp),
                    label: Text('Produtos'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                    label: Text('Carrinho'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.help),
                    label: Text('Ajuda'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: Text('Lista'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.list_alt),
                    label: Text('Formulário'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  print('selected: $value');
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
