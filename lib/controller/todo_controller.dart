import 'package:get/get.dart';

import '../model/ToDo.dart';

class ToDoController extends GetxController {
  final todoList = [].obs;
  List<ToDo> totoList = [
    ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
    ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
    ToDo(id: '03', todoText: 'Check Emails'),
    ToDo(id: '04', todoText: 'Team Meeting'),
    ToDo(id: '05', todoText: 'Work on mobile apps for 2 hours'),
    ToDo(id: '06', todoText: 'Dinner with Jenny'),
  ];
  @override
  void onReady() {
    // TODO: implement onReady
    totoList;
    todoList.value = totoList;
    super.onReady();
  }

  void addData(
      {required String id, required String todoText, bool isDone = false}) {
    final newToDo = ToDo(id: id, todoText: todoText, isDone: isDone);

    totoList.add(newToDo);
    print(newToDo);
    print(todoList.length);
    print(totoList.length);
    print('add Data');
    todoList.value = totoList;
  }

  void deleteData(String id) {
    totoList.removeWhere((todo) => todo.id == id);
  }
}
