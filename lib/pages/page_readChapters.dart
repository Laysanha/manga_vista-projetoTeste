import 'package:flutter/material.dart';
import 'package:manga_vista/components/custom_app_bar.dart';
import 'package:manga_vista/database/database.dart';
import '../models/scan_modal.dart';

class PageReadChapter extends StatefulWidget {
  final int chapterId;

  const PageReadChapter({super.key, required this.chapterId});

  @override
  State<PageReadChapter> createState() => _PageReadChapterState();
}

class _PageReadChapterState extends State<PageReadChapter> {
  late Future<Scan>  _chapterDetails;

  @override
  void initState(){
    super.initState();
    _chapterDetails = _fethChapterDetails(widget.chapterId);
  }

   Future<Scan> _fethChapterDetails(int id) async{
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('scan', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty){
      return Scan.fromMap(result.first);
    } else {
      throw Exception('Capítulo nao encontrado!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<Scan>(
          future: _chapterDetails,
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ${snapshot.error}'));
            } else if (!snapshot.hasData){
              return const Center(child: Text('Capítulo nao encontrado :('));
            } else {
              final scan = snapshot.data!;
              return ListView.builder(
                itemCount: scan.arquivoCapitulo.length,
                itemBuilder: (context, index) {
                  return Image.asset(scan.arquivoCapitulo[index]);
                }
              );
            }
          }
      )
    );
  }
}
