import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/global.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  TextEditingController txttittle=TextEditingController();
  TextEditingController txtdescription=TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("To-Do"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Add To-Do",
              style: TextStyle(fontSize: 22),
            ),
            // Spacer(),
            SizedBox(height: 10),
            TextField(
              controller: txttittle,
                decoration: InputDecoration(
                    label: Text("Tittle"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),

            SizedBox(
              height: 10,
            ),

            TextField(
              controller: txtdescription,
                decoration: InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),

            SizedBox(height: 15,),

            Center(child: FloatingActionButton(onPressed: (){
             TodoModel data = TodoModel(
               tittle: txttittle.text,
               description: txtdescription.text,
             );
             Global.g1.TodoList.add(data);
             Navigator.pop(context);
            },child: Text(" Save ",style: TextStyle(fontSize: 15)),)),
          ],
        ),
      ),
    ));
  }
}
