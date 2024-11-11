//import 'package:firebasewebexample/main.dart';
import 'package:firebasewebexample/model/todo_model.dart';
import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.preencherListaTodos();
    //List<TodoModel> lista = appState.todosLista;

    /** if (appState?.todosLista?.isEmpty ?? true) {
      return Center(
        child: Text('Não há registros.'),
      );
    }
*/
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
              for (TodoModel row in appState.todosLista)
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: Text(row.nome ??
                      ""), // Assuming `text` is the property in TodoModel
                  onTap: () {
                    appState.atualizarTodos(row);
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "todos-form", arguments: row);
                  },
                ),
            ],
          ),
        ));
  }
}
