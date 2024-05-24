import 'package:flutter/material.dart';
import 'package:manga_vista/components/custom_app_bar.dart';
import 'package:manga_vista/models/obra_model.dart';

class PageDetailObra extends StatelessWidget {
  final Obra obra;
  const PageDetailObra({super.key, required this.obra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(obra.capaObra),
          Text(obra.nomeObra),
          Text(obra.generoObra),
          Text(obra.sinopseObra),
        ],
      ),
    );
  }
}

Widget _buildImage(String imageUrl) {
  if(imageUrl.isEmpty) {
    //Vou ter uma imagem "Sen capa" no futuro proximo
    return const Text('Sem imagem');
  } else {
    return Image.asset(imageUrl);
  }
}