import 'dart:io';
import 'package:manga_vista/models/obra_model.dart';
import 'package:manga_vista/models/scan_modal.dart';
import 'package:manga_vista/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
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

    await db.execute('''
    CREATE TABLE scan (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      obraId INTEGER NOT NULL,
      nomeCapitulo TEXT,
      dataRgistro TEXT,
      statusCapitulo TEXT,
      arquivoCapitulo TEXT,
      FOREIGN KEY (obraId) REFERENCES obras (id) ON DELETE CASCADE
    )
    ''');

    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      password TEXT
    )
    ''');
  }

  Future<void> insertSampleData() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT COUNT(*) FROM obras');
    int? count = Sqflite.firstIntValue(result);
    if (count == 0) {
      List<Obra> testeObra = [
        Obra(
          capaObra: 'assets/images/imageTeste.png',
          nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
          nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
          generoObra: ['acao'],
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
        ),
        Obra(
          capaObra: 'assets/images/imageTeste2.jpg',
          nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
          nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
          generoObra: ['Açao', 'Romance', 'Aventura'],
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
        ),
        Obra(
          capaObra: 'Sem foto',
          nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
          nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
          generoObra: ['romance'],
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
        ),
        Obra(
          capaObra: 'assets/images/imageTeste3.png',
          nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
          nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
          generoObra: ['aventura'],
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
        ),
        Obra(
          capaObra: 'assets/images/imageTeste4.png',
          nomeObra: 'The Promissed no Neverland – Mama-tachi no Tsuisoukyoku',
          nomeAlternativoObra: 'Mama-tachi no Tsuisoukyoku',
          generoObra: ['escolar'],
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
        ),
      ];

      for (var obra in testeObra) {
        int obraId = await db.insert('obras', obra.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

        List<Scan> testeScans = [
          Scan(
            obraId: obraId,
            nomeCapitulo: 'Capítulo 1',
            dataRgistro: '2024-05-19',
            statusCapitulo: 'Novo',
            arquivoCapitulo: ['assets/images/story 1 (1).png', 'assets/images/story 1 (2).jpg']
          )
        ];
        for (var scan in testeScans){
          await db.insert('scan', scan.toMap());
        }
      }
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

  Future<void> updateObra(Obra obra) async {
    final db = await instance.database;
    await db.update(
      'obras',
      obra.toMap(),
      where: 'id = ?',
      whereArgs: [obra.id]
    );
  }

  Future<void> deleteObra(Obra obra) async {
    final db = await instance.database;
    await db.delete(
      'obras',
      where: 'id = ?',
      whereArgs: [obra.id]
    );
  }

  Future<void> insertScan(Scan scan) async {
    final db = await instance.database;
    await db.insert('scan', scan.toMap());
  }

  Future<List<Scan>> getScansByObra (int obraId) async {
    final db = await instance.database;
    final result = await db.query('scan', where: 'obraId = ?', whereArgs: [obraId]);

    return result.map((json) => Scan.fromMap(json)).toList();
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('Users', user.toMap());
  }

  Future<User?> getUserByEmailAndPassword(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
