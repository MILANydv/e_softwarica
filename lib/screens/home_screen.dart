// import 'package:e_softwarica/entities/student_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<String> lstImages = [
//     "https://www.pinclipart.com/picdir/middle/41-416584_head-clipart-student-cartoon-kids-face-png-download.png",
//   ];

//   List<Student> lstStudents = [];

//   @override
//   void initState() {
//     super.initState();
//     _getStudents();
//   }

//   _getStudents() async {
//     try {
//       final database = await DatabaseInstance.instance.getDatabaseInstance();
//       lstStudents = await database.studentDAO.getAllStudents();
//     } catch (e) {
//       MotionToast.error(description: const Text('Error getting students'))
//           .show(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Details'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ListView.builder(
//           itemCount: lstStudents.length,
//           itemBuilder: (context, index) {
//             return studentCard(lstStudents[index]);
//           },
//         ),
//       ),
//     );
//   }

//   Widget studentCard(Student student) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.blue,
//             child: Image.network(lstImages[0]),
//           ),
//           title: Text(student.fname),
//           subtitle: Text(student.lname),
//           trailing: Wrap(
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.edit),
//               ),
//               IconButton(
//                 onPressed: () {
//                   // delete
//                 },
//                 icon: const Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
