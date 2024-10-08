import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/task_group_repository.dart';

class TaskGroupProvider extends ChangeNotifier{
  final taskGroupRepository =  TaskGroupRepository();


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<TaskGroup> _taskGroups =[];
  List<TaskGroup> get taskGroups => _taskGroups;

  Future<void> listTaskGroups() async{
      _isLoading = true; //vai servir como notificação de que a tela estará carregando
      notifyListeners(); //redesenha a tela
      _taskGroups = await taskGroupRepository.listTaskGroups();
      _isLoading=false;
      notifyListeners();
  }
}