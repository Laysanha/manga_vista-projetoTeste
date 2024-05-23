import 'dart:io';
import 'package:manga_vista/models/obra_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'obras_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

//CRUD
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE obras(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        capaObra TEXT,
        nomeObra TEXT,
        nomeAlternativoObra TEXT,
        generoObra TEXT,
        dataRegistroObra TEXT,
        dataUpdateObra TEXT,
        colecaoScanObra TEXT,
        sinopseObra TEXT,
        temCorObra INTEGER,
        maiorIdadeObra INTEGER,
        statusObra TEXT,
        tipoObra TEXT,
        envolvidosObra TEXT,
        autorObra TEXT,
        artistaObra TEXT,
        anoLancamentoObra INTEGER,
        comentarioObra TEXT
      )
    ''');
  }

  //Dados fakes
  Future<void> insertSampleData() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT COUNT(*) FROM obras');
    int? count = Sqflite.firstIntValue(result);

    if (count == 0) {
    //Dados da tabelinha exemplo :)
    Obra exempleObra = Obra(
        capaObra: 'Vazio',
        nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
        nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
        generoObra: 'acao',
        dataRegistroObra: '2024-05-17',
        dataUpdateObra: '2024-06-25',
        colecaoScanObra: 'LaysanhaScan',
        sinopseObra: 'As duas mães do Orfanato Grace Field lembram de eventos importantes de seu passado...',
        temCorObra: false,
        maiorIdadeObra: false,
        statusObra: 'em andamento',
        tipoObra: 'manga',
        envolvidosObra: 'Laysa',
        autorObra: 'nao é a Laysa',
        artistaObra: 'tb nao é a Laysa',
        anoLancamentoObra: 2024,
        comentarioObra: '',
    );
    await db.insert('obras', exempleObra.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<void> insertObra (Obra obra) async {
    final db = await database;
    await db.insert(
        'obras',
        obra.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Obra>> getObras() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('obras');
    return List.generate(maps.length, (i) {
      return Obra.fromMap(maps[i]);
    });
  }
}