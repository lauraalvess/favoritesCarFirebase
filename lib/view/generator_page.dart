import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();

  GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    //appState.preencherLista();
    //appState.preencherListaTodos();

    return ListView(
      children: <Widget>[
        const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("Acesso ao perfil"),
          ),
        ),
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Nome Completo'),
          maxLength: 100,
          //validator: _validarNome,
          onSaved: (String? val) {},
        ),
        TextFormField(
            controller: _controller2,
            decoration: const InputDecoration(hintText: 'Idade'),
            keyboardType: TextInputType.number,
            maxLength: 3,
            //validator: _validarIdade,
            onSaved: (String? val) {}),
        const SizedBox(height: 15.0),
        ElevatedButton(
          onPressed: () {
            //TO DO:
          },
          child: const Text('Enviar'),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.clear();
            _controller2.clear();
          },
          child: const Text('Limpar'),
        )
      ],
    );
  }
}
