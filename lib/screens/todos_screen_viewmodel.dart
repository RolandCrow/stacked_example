

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example/app/locator.dart';
import 'package:stacked_example/services/todos.service.dart';

import '../models/todo.dart';

class TodosScreenViewModel extends ReactiveViewModel {


  final _firstTodoFocusNode = FocusNode();
  final _todosService = locator<TodosService>(); // инжектим через di
  late final toggleStatus = _todosService.toggleStatus;
  late final removeTodo = _todosService.removeToDo;
  late final updateTodoContent = _todosService.updateTodoContent;

  List<Todo> get todos => _todosService.todos;

  void newTodo() {
    _todosService.newTodo();
    _firstTodoFocusNode.requestFocus();
  }

  FocusNode? getFocusNode(String id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    return index == 0 ? _firstTodoFocusNode: null;
  }


  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices => [_todosService]; // реактивная вью модель


}