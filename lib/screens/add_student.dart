import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Student Name',
              hintText: 'Enter your student name',
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Student Email',
              hintText: 'Enter your student email',
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //   ListTile(
          //   title: const Text('Lafayette'),
          //   leading: Radio<SingingCharacter>(
          //     value: SingingCharacter.lafayette,
          //     groupValue: _character,
          //     onChanged: (SingingCharacter? value) {
          //       setState(() {
          //         _character = value;
          //       });
          //     },
          //   ),
          // ),

          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Student Phone',
              hintText: 'Enter your student phone',
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Add Student'))),
        ]),
      ),
    );
  }
}
