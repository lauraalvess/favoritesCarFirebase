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

    //List<TodoModel> lista = appState.todosLista;

    /** if (appState?.todosLista?.isEmpty ?? true) {
      return Center(
        child: Text('Não há registros.'),
      );
    }
*/

    /* return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        debugShowCheckedModeBanner: false,
        home: 
        */
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Todos'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          // if (constraints.maxWidth > 600) {
          // Layout para telas maiores (ex: tablets, desktops)
          return Row(children: [
            //Expanded(
            //  flex: 1,
            //  child: MyHomePage(),
            //),
            // VerticalDivider(width: 1),
            Expanded(
              //   flex: 3,
              child: //ListView.builder(
                  ListView(
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

                        // Navigator.push(
                        //  context,
                        //   MaterialPageRoute(builder: (context) => TodoFormPage()),
                        // );
                      },
                    ),
                  //ElevatedButton(
                  //onPressed: () {
                  //Navigator.of(context).pop();
                  //Navigator.pushNamed(context, MyApp.TODOS_LIST);
                  // },
                  // child: Text("Página Inicial"))
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
