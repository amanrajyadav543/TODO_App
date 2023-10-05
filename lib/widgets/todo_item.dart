
import 'package:flutter/material.dart';
import 'package:todo_app/contrats/rang.dart';

import 'package:todo_app/model/todo.dart';

class TodoItem extends StatelessWidget{
  final ToDo todo ;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}) : super(key: key);



 @override
  Widget build (BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:ListTile(
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(todo.isDone ?Icons.check_box: Icons.check_box_outline_blank,color: tdBlue,),
        title: Text(

        todo.todoText!
          , style: TextStyle(color: tdBlack, fontSize: 20,
        decoration:todo.isDone ? TextDecoration.lineThrough : null),),
        trailing: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18, icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),


    );
  }
}
