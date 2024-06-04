import 'package:manga_vista/database/database.dart';
import 'package:manga_vista/models/obra_model.dart';

class ObraController {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<List<Obra>> getObras() async{
    return await _databaseHelper.getObras();
  }
}