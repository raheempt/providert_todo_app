import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/model/textfiled.dart';
import 'package:providerapp/controller/provider.dart';

class AddList extends StatelessWidget {
  const AddList({super.key});

  @override
  Widget build(BuildContext context) {
    Providerdemo provider = Provider.of<Providerdemo>(context, listen: false);
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final contactController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    //  showimagePickeroption(context);
                  },
                  icon: Icon(Icons.add_a_photo, size: 60),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFieldDemo(
                  controller: nameController,
                  name: 'name',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldDemo(
                  controller: ageController,
                  name: 'age',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldDemo(
                  controller: contactController,
                  name: 'contact',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldDemo(
                  controller: emailController,
                  name: 'email',
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text;
                    final age = ageController.text;
                    final contact = contactController.text;
                    final email = emailController.text;
                    provider.addNotes(name, age, contact, email);

                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
