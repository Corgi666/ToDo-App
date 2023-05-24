import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_color.dart';
import 'package:todoapp/model/ToDo.dart';
import 'package:todoapp/widgets/todo_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: bodyPage(),
    );
  }
}

class bodyPage extends StatefulWidget {
  const bodyPage({super.key});

  @override
  State<bodyPage> createState() => _bodyPageState();
}

class _bodyPageState extends State<bodyPage> {
  final todosList = ToDo.totoList();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Search(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 50),
                    child: Text(
                      'All ToDos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for(ToDo todo in todosList)
                  ToDoItem(todo: todo)
                ],
              ),
            )
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
