import 'package:e_softwarica/database/database_instance.dart';
import 'package:e_softwarica/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _addStudent(User user) async {
    try {
      final database = await DatabaseInstance.instance.getDatabaseInstance();
      await database.userDAO.register(user);
      MotionToast.success(description: const Text("Successfully Registered"))
          .show(context);
    } catch (e) {
      MotionToast.error(description: const Text("Error")).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'enter your first name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter  first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'enter last name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
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
                      final user = User(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      _addStudent(user);
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
