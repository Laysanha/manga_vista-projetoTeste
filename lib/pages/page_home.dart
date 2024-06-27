import 'package:flutter/material.dart';
import 'package:manga_vista/database/database.dart';
import 'package:manga_vista/pages/page_detail_obra.dart';
import '../models/obra_model.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await DatabaseHelper.instance.insertSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Obra>>(
        future: DatabaseHelper.instance.getObras(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar obras. :('));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text('Nenhuma arquivo cadastrado. :('));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 8,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Obra obra = snapshot.data![index];
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16
                  ),
                  child: ListTile(
                    title: Text(obra.nomeObra),
                    subtitle: Text(obra.generoObra.join(', ')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageDetailObra(obra: obra)
                        )
                      );
                    },
                  ),
                );
              }
            );
          }
        }
      ),
    );
  }
}
