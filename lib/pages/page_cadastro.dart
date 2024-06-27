import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../models/user_model.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  void _resgiter() async {
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      User user = User(email: _email, password: _password);
      await _databaseHelper.insertUser(user);
      
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
    );
  }
}
