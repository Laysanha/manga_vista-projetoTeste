import 'package:flutter/material.dart';
import 'package:manga_vista/components/custom_app_bar.dart';

class PageNotificacao extends StatefulWidget {
  const PageNotificacao({super.key});

  @override
  State<PageNotificacao> createState() => _PageNotificacaoState();
}

class _PageNotificacaoState extends State<PageNotificacao> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(showButtons: false),
      body: Center(
        child: Text("Notificação"),
      ),
    );
  }
}
