

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/models/todo.dart';
import 'package:riverpod_test/providers/general_providers.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(ref.read);
});

class TodoRepository {
  TodoRepository(this._read);

  Reader _read;

  Future<List<MyTodo>> retriveTodos({required String userId}) async {
    try {
      final snap = await _read(firestoreProvider)
          .collection('todos')
          .where('userId', isEqualTo: userId)
          .get();

      return snap.docs.map((doc) => MyTodo.fromJson(doc.data())).toList();
    } on FirebaseException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
