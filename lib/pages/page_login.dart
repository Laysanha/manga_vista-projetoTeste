import 'package:flutter/material.dart';
import 'package:manga_vista/data/datasources/local/shared_preferences_helper.dart';
import 'package:manga_vista/pages/page_home.dart';
import 'package:manga_vista/pages/page_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper();

  void  _login() async {
    final form = _formKey.currentState;
    if (form!.validate()){
      form.save();
      Map<String, String>? user = await _prefsHelper.getUser();
      if(user != null && user['email'] == _email && user['password'] == _password) {
        ScaffoldMessenger.of(context).showSnackBar(const
          SnackBar(content: Text('Login efetuado com sucesso!!'))
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PageHome())
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const
        SnackBar(content: Text('Login invalido!!'))
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
                  onPressed: _login,
                  child: const Text('Login'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
                child: const Text('teste'),
              ),
            ],
          )
        )
      ),
    );
  }
}
