import 'package:flutter/material.dart';
import 'package:manga_vista/components/custom_app_bar.dart';
import 'package:manga_vista/pages/page_login.dart';
import '../data/datasources/local/shared_preferences_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper();

  void  _register() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      await _prefsHelper.saveUser(_email, _password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Restrado com sucesso!')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty ? 'Digite seu e-mail' : null,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) => value!.isEmpty ? 'Digite sua senha' : null,
              onSaved: (value) => _password = value!,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Resgristar'),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Voltar'),
            ),
          ]
          )
        )
      )
    );
  }
}
