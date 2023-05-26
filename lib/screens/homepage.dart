import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants/app_color.dart';
import 'package:todoapp/controller/todo_controller.dart';
import 'package:todoapp/model/ToDo.dart';
import 'package:todoapp/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    ToDoController toDoController = Get.find();
    dispose() {
      _controller.dispose();
      super.dispose();
    }

    // final todo = ''.obs;
    return Scaffold(
      backgroundColor: AppColor.tdBGColor,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
              color: AppColor.tdBlack,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/kishibe.png'),
                      fit: BoxFit.cover)),
              width: 40,
              height: 40,
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColor.tdBGColor,
      ),
      body: Stack(
        children: [
          bodyPage(),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            // todo.value = value;
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: AppColor.tdBlue),
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                              onPressed: () {
                                final id = 7.obs;
                                toDoController.addData(
                                    id: id.value.toString(),
                                    todoText: _controller.text);

                                id.value++;
                              },
                              icon: Icon(Icons.add)))
                    ],
                  )))
        ],
      ),
    );
  }
}

class bodyPage extends StatefulWidget {
  const bodyPage({super.key});

  @override
  State<bodyPage> createState() => _bodyPageState();
}

class _bodyPageState extends State<bodyPage> {
  final todosList = Get.find<ToDoController>().todoList;

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Search(),
            Expanded(
                child: Obx(
              () => ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 50),
                    child: Text(
                      'All ToDos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (ToDo todo in todosList) ToDoItem(todo: todo)
                ],
              ),
            ))
          ],
        ));
  }

  Container Search() {
    return Container(
      padding: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.tdBlack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: AppColor.tdGrey)),
      ),
    );
  }
}
