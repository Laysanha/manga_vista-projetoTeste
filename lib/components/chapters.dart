import 'package:flutter/material.dart';
import 'package:manga_vista/models/scan_modal.dart';
import 'package:manga_vista/pages/page_readChapters.dart';
import '../database/database.dart';

class Chapters extends StatefulWidget {
  final int obraId;
  const Chapters({super.key, required this.obraId});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  List<Scan> scans = [];

  @override
  void initState(){
    super.initState();
    _loadScans();
  }

  Future<void> _loadScans() async {
    final dbHelper = DatabaseHelper.instance;
    final loadedScans = await dbHelper.getScansByObra(widget.obraId);

    for (var scan in loadedScans){
      if (scan.id == null){
        print('Scan com ID nulo encontrado: $scan');
      }
    }

    setState((){
      scans = loadedScans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return scans.isEmpty
      ? const Center(child: Text('Nenhum capitulo encontrado :('),)
      : ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: scans.length,
        itemBuilder: (context, index) {
          Scan scan = scans[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(scan.nomeCapitulo),
              subtitle: Text(scan.dataRgistro),
              onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => PageReadChapter(chapterId: scan.id!)
                  )
                );
              },
            ),
          );
        }
    );
  }
}
