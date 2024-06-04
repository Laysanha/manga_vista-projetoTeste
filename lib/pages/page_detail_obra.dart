import 'package:flutter/material.dart';
import 'package:manga_vista/components/chapters.dart';
import 'package:manga_vista/components/custom_app_bar.dart';
import 'package:manga_vista/components/favoriteButton.dart';
import 'package:manga_vista/models/obra_model.dart';
import 'package:path/path.dart';

class PageDetailObra extends StatelessWidget {
  final Obra obra;
  const PageDetailObra({super.key, required this.obra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildImage(obra.capaObra),
            Text(obra.nomeObra),
            Text(obra.generoObra.join(', ')),
            Text(obra.dataRegistroObra),
            Center(
              child: Text(obra.sinopseObra),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Chapters(obraId: obra.id!)
                        )
                    );
                  },
                  child: const Text('Primeiro Capitulo'),
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text('Último Capitulo'),
                ),
               const FavoriteButton()
              ]
            ),
            const Row(
              children: [
                Text(
                  'Capítulos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImage(String imageUrl) {
  if(imageUrl.isEmpty || imageUrl == 'Sem foto') {
    //Vou ter uma imagem "Sen capa" no futuro proximo
    return const Text('Sem imagem');
  } else {
    return Image.asset(imageUrl);
  }
}