
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/contrats/rang.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key }) : super(key: key);

  @override
  State<Home> createState()=>  Homestate();
}

class Homestate  extends State<Home>{
  final todolist = ToDo.todoList();
  final todocontroler = TextEditingController();
  List<ToDo> gettodo= [];


  @override
  void initState() {
    gettodo = todolist;
    super.initState();
  }

  Widget build(BuildContext context){

    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                searchbox(),
                Expanded(child:   ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text('Today ToDo`s', style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w500),),
                    ),

                    for(ToDo todoo in  gettodo.reversed)
                      TodoItem(todo: todoo,
                        onToDoChanged: handletochange,
                          onDeleteItem: delete,
                      )

                  ],
                )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(bottom: 20,
                      left: 20,
                      right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const[BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: todocontroler,
                    decoration: InputDecoration(
                        hintText: 'Add a New TODO '
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    child: Text("+",style: TextStyle(fontSize: 40),),
                    onPressed: (){
                      additem(todocontroler.text);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: tdBlue,
                        minimumSize: Size.square(55),
                        elevation: 10
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
  Widget searchbox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => filter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack,size: 20,),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'search',
            hintStyle: TextStyle(color: Colors.grey)

        ),
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(

        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRect(

                child: Icon(
                  Icons.man,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        )
    );
  }

  void delete(String id){
    setState(() {
      todolist.removeWhere((item) => item.id== id);
    });
  }
  void additem( String todo){
    setState(() {

      todolist.add(ToDo(id:DateTime.now().microsecond.toString(), todoText: todo));
    });
    todocontroler.clear();
  }

  void filter(String keyword){
    List<ToDo> result = [];

    if( keyword.isEmpty){
      result = todolist;
    }
    else{
      result= todolist.where((item) => item.todoText!
      .toLowerCase().
      contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      gettodo = result;
    });
  }

  void handletochange(ToDo toDo){

    setState((){
      toDo.isDone = !toDo.isDone;
    });
  }
  
}


