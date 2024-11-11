import 'package:firebasewebexample/model/todo_model.dart';
import 'package:firebasewebexample/service/firestore_service.dart';
import 'package:flutter/material.dart';

class TodoFormPage extends StatefulWidget {
  TodoFormPage({super.key});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  var _controller = TextEditingController();

  late bool _firstInitiate = false;

  late TodoModel? t = TodoModel();

  @override
  void initState() {
    super.initState();
    _firstInitiate = false;
    print("Dentro do initState ");
  }

  @override
  Widget build(BuildContext context) {
    //recuperar id do contexto
    if (_firstInitiate) {
      t = ModalRoute.of(context)?.settings.arguments as TodoModel;

      _firstInitiate = false;
      //print("Nome de seleçao editado: " + t!.nome);
      //preencher os dados do formulario camposcontroller
      _controller.text = t!.nome ?? "";
    }

    //var appState = context.watch<MyAppState>();
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                  //print("Dentro do botao " + t.nome + t.id!);
                  var tDao = FirestoreService();
                  var id = t!.id;
                  if (id == null) {
                    var t = TodoModel(
                        status: true,
                        nome: _controller.text,
                        criadoEm: DateTime.now());

                    tDao.addTodo(t);
                  } else {
                    var t = TodoModel(
                        status: true,
                        nome: _controller.text,
                        criadoEm: DateTime.now());

                    tDao.updateTodo(t.id!, t);
                  }

                  _controller.clear();
                },
                child: const Text('Enviar'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: const Text('Limpar'),
              )
            ],
          ),
        ));
  }
}
