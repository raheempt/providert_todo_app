import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/controller/provider.dart';
import 'package:providerapp/view/addlist.dart';
import 'package:providerapp/view/update.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 226, 255),
        title: Text('TODO APP'),
      ),
      body: Consumer<Providerdemo>(builder: (context, providerdemo, child) {
        final todos = Providerdemo.todoBox.values.toList();
        if (todos.isEmpty) {
          return Center(
            child: Text('No Data Available'),
          );
        } else {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, intex) {
                final todo = todos[intex];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('name:${todo.name}'),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateList(
                                  index: intex,
                                  name: todo.name,
                                  age: todo.age,
                                  contact: todo.contact,
                                  email: todo.email,
                                )));
                  },
                  trailing: IconButton(
                      onPressed: () {
                        providerdemo.deleteNotes(intex);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('deleted successfully!')));
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 150, 17, 8),
                      )),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddList())),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 7, 255, 48),
        ),
      ),
    );
  }
}
