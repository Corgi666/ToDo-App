import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/todo_controller.dart';

import '../constants/app_color.dart';
import '../model/ToDo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  const ToDoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    ToDoController controller = Get.find();
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: AppColor.tdBlue,
        ),
        title: Text(
          todo.todoText.toString(),
          style: TextStyle(
            fontSize: 16,
            color: AppColor.tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: AppColor.tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              controller.deleteData(id);
            },
            icon: Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
