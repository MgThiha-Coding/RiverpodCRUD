import 'package:flutter_riverpod/flutter_riverpod.dart';

class CRUDNotifier extends StateNotifier<List<String>> {
  CRUDNotifier() : super([]);

  void add(String value) {
    state = [...state, value];
  }

  void remove(String value) {
    state = state.where((element) => element != value).toList();
  }

  void update(String value, String updatedValue) {
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == value) {
        updatedList.add(updatedValue);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList; // Update the state to the new list
  }
}

final crudNotifierProvider = StateNotifierProvider<CRUDNotifier, List<String>>((ref) {
  return CRUDNotifier();
});
