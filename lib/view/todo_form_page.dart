import 'package:firebasewebexample/model/todo_model.dart';
import 'package:firebasewebexample/service/firestore_service.dart';
import 'package:firebasewebexample/view/my_app.dart';
import 'package:firebasewebexample/view/my_homepage_state.dart';
import 'package:flutter/material.dart';

class TodoFormPage extends StatefulWidget {
  const TodoFormPage({super.key});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  final _controller = TextEditingController();

  late bool _firstInitiate = false;

  late TodoModel? t = TodoModel();

  var label = "";

  @override
  void initState() {
    super.initState();
    _firstInitiate = true;
    print("Dentro do initState ");
  }

  @override
  Widget build(BuildContext context) {
    //recuperar id do contexto
    if (ModalRoute.of(context)!.settings.arguments != null) {
      t = ModalRoute.of(context)?.settings.arguments as TodoModel;

      if (t == null) {
        print('todomodel nulo');
      } else {
        _controller.text = t!.nome ?? "";
      }
    }

    void _updateLabelText() {
      setState(() {
        label = "Salvo com sucesso!";
      });
    }

    //var appState = context.watch<MyAppState>();
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //drawer: MyHomePage(),
          body: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text("Cadastro Todos"),
                ),
              ),
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Nome'),
                maxLength: 100,
                //validator: _validarNome,
                onSaved: (String? val) {
                  //pode ser usado para atribuir o valor do campo ao objeto
                },
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  try {
                    var tDao = FirestoreService();
                    var idR = t!.id;
                    if (idR == null) {
                      t = TodoModel(
                          status: true,
                          nome: _controller.text,
                          criadoEm: DateTime.now());
                      print("entrou no botao salvar");
                      tDao.addTodo(t!);
                    } else {
                      t = TodoModel(
                          id: idR,
                          status: true,
                          nome: _controller.text,
                          criadoEm: DateTime.now());
                      print("entrou no botao alterar "); // + t!.id!);
                      tDao.edit(t!);
                    }
                  } catch (ex) {
                    throw Exception(ex);
                  }
                  _controller.clear();
                  _updateLabelText();
                },
                child: const Text('Enviar'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: const Text('Limpar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.TODOS_EDIT);
                },
                child: const Text('Listar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
              const SizedBox(height: 15.0),
              Text(
                label,
              ),
            ],
          ),
        ));
  }
}
