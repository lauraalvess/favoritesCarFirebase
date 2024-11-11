import 'package:firebasewebexample/model/todo_model.dart';
import 'package:firebasewebexample/service/firestore_service.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = "";
  var tDao = FirestoreService();
  var favorites = [];
  late List<TodoModel> todosLista = [];

  void atualizarTodos(TodoModel td) async {
    print("Entrou atualizar todos ");
    tDao.updateTodo(td.id!, td);
    print("Saiu atualizar todos ");
  }

  void preencherListaA() {
    favorites.add("current");
    favorites.add("2");
  }

  Future<void> preencherListaTodos() async {
    print("Entrou Preencher Lista Todos ");
    todosLista = await tDao.getTodos();
    print("Tamanho da lista depois " + todosLista.length.toString());
  }

  void marcarFavorito() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removerFavorito(var pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    }
    notifyListeners();
  }

  void removerFavoritoTodos(var tModel) {
    todosLista.remove(tModel);
    tDao.deleteTodo(tModel.id);
    notifyListeners();
  }
}
