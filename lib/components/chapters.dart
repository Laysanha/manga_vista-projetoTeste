import 'package:flutter/material.dart';
import 'package:manga_vista/components/custom_app_bar.dart';
import 'package:manga_vista/models/scan_modal.dart';
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

    setState((){
      scans = loadedScans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: scans.isEmpty 
          ? const Center(child: Text('Nenhum capitulo encontrado :('),)
          : ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) {
              Scan scan = scans[index];
              return ListTile(
                title: Text(scan.nomeCapitulo),
                subtitle: Text(scan.dataRgistro),
              );
            }
        )
      ),
    );
  }
}
