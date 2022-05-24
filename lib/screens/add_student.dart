import 'package:e_softwarica/database/database_instance.dart';
import 'package:e_softwarica/entities/student_entity.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  String value = '';
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  _addStudent(Student student) async {
    try {
      final database = await DatabaseInstance.instance.getDatabaseInstance();
      await database.studentDAO.insertStudent(student);
      MotionToast.success(description: const Text("Successfully Added"))
          .show(context);
    } catch (e) {
      MotionToast.error(description: const Text("Error")).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student Name',
                hintText: 'Enter your student name',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter student name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student Age',
                hintText: 'Enter your age',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter age';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Gender'),
            ListTile(
              title: const Text('Male'),
              leading: Radio(
                value: 'male',
                groupValue: value,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio(
                value: 'female',
                groupValue: value,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student Address',
                hintText: 'Enter your  Address',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final student = Student(
                          name: _nameController.text,
                          gender: value,
                          age: int.parse(_ageController.text),
                          address: _addressController.text,
                        );
                        _addStudent(student);
                      }
                    },
                    child: const Text('Add Student'))),
          ]),
        ),
      ),
    );
  }
}
