
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/screen/home.dart';

void main(){
  runApp(const Myapp());

}

class Myapp extends StatelessWidget{

  const Myapp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'TODO APP',
    home: Home(),
  );
  }
}

