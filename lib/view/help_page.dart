import 'package:firebasewebexample/model/todo_model.dart';
import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:firebasewebexample/view/my_app.dart';
import 'package:firebasewebexample/view/my_homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.preencherListaTodos();

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Todos'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Row(children: [
            Expanded(
              child: ListView(
                children: [
                  for (TodoModel todo in appState.todosLista)
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: Text(todo.nome ??
                          ""), // Assuming `text` is the property in TodoModel
                      onTap: () {
                        appState.atualizarTodos(todo);
                        //Navigator.of(context).pop();
                        Navigator.pushNamed(context, MyApp.TODOS_FORM,
                            arguments: todo);
                      },
                    ),
                ],
              ),
            )
          ]);
          //}
        })
        //)
        );
  }
}
