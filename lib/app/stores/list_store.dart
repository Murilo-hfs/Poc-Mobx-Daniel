import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_mobx_leonardo/app/stores/todo_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newToDoTitle = '';

  @action
  void setNewTodoTitle(String value) => newToDoTitle = value;

  @computed
  bool get isFormValid => newToDoTitle.isNotEmpty;
  @observable
  bool throwError = false;
  @action
  Widget? setError() {
    if (throwError) throw "An Error";
  }

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList..insert(0, TodoStore(newToDoTitle));
    newToDoTitle = '';
  }
}
