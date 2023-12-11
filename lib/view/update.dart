import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/model/studentapp.dart';
import 'package:providerapp/model/textfiled.dart';
import 'package:providerapp/controller/provider.dart';

class UpdateList extends StatefulWidget {
  final String name;
  final String age;
  final String contact;
  final String email;
  final int index;

  const UpdateList({
    Key? key,
    required this.index,
    required this.name,
    required this.age,
    required this.contact,
    required this.email,
  }) : super(key: key);

  @override
  State<UpdateList> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController contactController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    ageController = TextEditingController(text: widget.age);
    contactController = TextEditingController(text: widget.contact);
    emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    contactController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoBox = Hive.box<studentapp>('todobox');
    final provider = Provider.of<Providerdemo>(context, listen: false);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Implement image update logic
                  },
                  icon: Icon(Icons.add_a_photo, size: 60),
                ),
                SizedBox(height: 30),
                TextFieldDemo(controller: nameController, name: 'name'),
                SizedBox(height: 10),
                TextFieldDemo(controller: ageController, name: 'age'),
                SizedBox(height: 10),
                TextFieldDemo(controller: contactController, name: 'contact'),
                SizedBox(height: 10),
                TextFieldDemo(controller: emailController, name: 'email'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final age = ageController.text;
                    final contact = contactController.text;
                    final email = emailController.text;

                    provider.updateNotes(
                      widget.index,
                      name,
                      age,
                      contact,
                      email,
                    );

                    studentapp updatedList = studentapp(
                      name: name,
                      age: age,
                      contact: contact,
                      email: email,
                    );

                    todoBox.putAt(widget.index, updatedList);

                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
