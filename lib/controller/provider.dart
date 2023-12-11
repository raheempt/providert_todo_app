import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:providerapp/model/studentapp.dart';

class Providerdemo extends ChangeNotifier {
  static final todoBox = Hive.box<studentapp>('todobox');

  addNotes(
    String name,
    String age,
    String contact,
    String email,
  ) {
    studentapp studentApp = studentapp(
      name: name,
      age: age,
      contact: contact,
      email: email,
    );
    todoBox.add(studentApp);
    notifyListeners();
  }

  deleteNotes(int index) async {
    await todoBox.deleteAt(index);
    notifyListeners();
  }

  updateNotes(
    int index,
    String name,
    String age,
    String contact,
    String email,
  ) {
    studentapp studentApp = studentapp(
      name: name,
      age: age,
      contact: contact,
      email: email,
    );
    todoBox.putAt(index, studentApp);
    notifyListeners();
  }
}
