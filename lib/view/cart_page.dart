import 'package:firebasewebexample/service/firestore_service.dart';
import 'package:firebasewebexample/view/controller/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    var _controller2 = TextEditingController();
    var _controller3 = TextEditingController();

    var appState = context.watch<MyAppState>();

    return ListView(
      children: <Widget>[
        const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("Cadastro de Usuário"),
          ),
        ),
        TextFormField(
            controller: _controller3,
            decoration: const InputDecoration(hintText: 'Nome'),
            maxLength: 40,
            onSaved: (String? val) {}),
        const SizedBox(height: 15.0),
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'E-mail'),
          keyboardType: TextInputType.emailAddress,
          maxLength: 100,
          //validator: _validarNome,
          onSaved: (String? val) {},
        ),
        TextFormField(
            controller: _controller2,
            decoration: const InputDecoration(hintText: 'Senha'),
            keyboardType: TextInputType.visiblePassword,
            maxLength: 8,
            onSaved: (String? val) {}),
        const SizedBox(height: 15.0),
        ElevatedButton(
          onPressed: () {
            salvarUsuario(
                _controller.text, _controller2.text, _controller3.text);
          },
          child: const Text('Enviar'),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.clear();
            _controller2.clear();
            _controller3.clear();
          },
          child: const Text('Limpar'),
        )
      ],
    );
  }

  salvarUsuario(String email, String senha, String nome) {
    try {
      var fDAO = FirestoreService();
      fDAO.testeUsuario(email, senha, nome);
    } on Exception catch (_, ex) {}
  }
}
