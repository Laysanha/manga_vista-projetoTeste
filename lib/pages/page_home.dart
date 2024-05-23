import 'package:flutter/material.dart';
import 'package:manga_vista/controllers/obra_controller.dart';
import 'package:manga_vista/database/database.dart';

import '../models/obra_model.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Future<List<Obra>> _obrasFuture;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await DatabaseHelper.instance.insertSampleData();
    setState(() {
      _obrasFuture = DatabaseHelper.instance.getObras();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Obra>>(
        future: _obrasFuture,
        builder: (context, snapshot){
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
            print(snapshot.hasError);
            return const Center(child: Text('Erro ao carregar obras. :('));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text('Nenhuma arquivo cadastrado. :('));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Obra obra = snapshot.data![index];

                print('Nome da obra: ${obra.nomeObra}');
                print('Gênero da obra: ${obra.generoObra}');

                return ListTile(
                  title: Text(obra.nomeObra),
                  subtitle: Text(obra.generoObra),
                  onTap: (){},
                );
              }
            );
          }
        }
      ),
    );
  }
}
