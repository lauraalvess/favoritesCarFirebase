import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasewebexample/model/todo_model.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  var firestore = FirebaseFirestore.instance;

  Future<String> addTodo(TodoModel model) async {
    try {
      var snapshot = await firestore.collection('todos').add(model.toMap());
      return snapshot.id;
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  Future<List<TodoModel>> getTodos() async {
    try {
      var snapshot = firestore.collection('todos').get();
      return snapshot.then(
        (querySnapshot) {
          return querySnapshot.docs.map((todo) {
            var mapData = todo.data();
            mapData['id'] = todo.id;
            return TodoModel.fromJson(mapData);
          }).toList();
        },
      );
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  Future<void> updateTodo(String id, TodoModel t) async {
    try {
      var snapshot = firestore.collection('todos').doc(id);
      await snapshot.update({
        //'completed': true,
        'updateAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  Future<void> updateTodo3(String id) async {
    try {
      var snapshot = firestore.collection('todos').doc(id);
      await snapshot.update({
        //'completed': true,
        'updateAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      final snapshot = firestore.collection('todos').doc(id);
      return await snapshot.delete();
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  Future<void> deleteAllData() async {
    try {
      final snapshot = await firestore.collection('todos').get();
      final List<DocumentSnapshot> docs = snapshot.docs;
      for (DocumentSnapshot doc in docs) {
        await doc.reference.delete();
      }
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }
}