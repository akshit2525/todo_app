import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txttittle = TextEditingController();
  TextEditingController txtdescription = TextEditingController();
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("To-Do"),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              }, icon: Icon(isGrid ? Icons.grid_on_rounded : Icons.list)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isGrid ? ListView.builder(
              itemCount: Global.g1.TodoList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onDoubleTap: () {
                    setState(() {
                      Global.g1.TodoList.removeAt(index);
                    });
                  },
                  onLongPress: () {
                    TodoModel t1 = Global.g1.TodoList[index];
                    txttittle.text = t1.tittle!;
                    txtdescription.text = t1.description!;
                  },

                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.15,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.95,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(3)),
                        Text("${Global.g1.TodoList[index].tittle}",
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("${Global.g1.TodoList[index].description}",
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold)),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'data');
                            },
                            child: Icon(Icons.add),
                          ),
                        )

                      ],
                    ),
                  ),
                );
              },
            )
                : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: Global.g1.TodoList.length,
              itemBuilder: (context, index) {
                TodoModel data = Global.g1.TodoList[index];
                return InkWell(
                  onDoubleTap: () {
                    setState(() {
                      Global.g1.TodoList.removeAt(index);
                    });
                  },
                  onLongPress: () {
                    TodoModel t1 = Global.g1.TodoList[index];
                    txttittle.text = t1.tittle!;
                    txtdescription.text = t1.description!;
                    // editDialog(context, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data.tittle}",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "${data.description}",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

          ),
        ));
  }
}
