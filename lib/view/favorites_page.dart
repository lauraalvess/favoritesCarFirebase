import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.preencherListaTodos();

    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Lista '),
              ),
              for (var row in appState.todosLista)
                ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: Text(row.nome ??
                      ""), // Assuming `text` is the property in TodoModel
                  onTap: () {
                    appState.removerFavoritoTodos(row);
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "/");
                  },
                ),
            ],
          ),
        ));
  }
}
