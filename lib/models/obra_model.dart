class Obra {
  int? id;
  String capaObra;
  String nomeObra;
  String nomeAlternativoObra;
  List<String> generoObra;
  String dataRegistroObra;
  String dataUpdateObra;
  String colecaoScanObra;
  String sinopseObra;
  bool temCorObra;
  bool maiorIdadeObra;
  String statusObra;
  String tipoObra;
  String envolvidosObra; //Equipe que trabalhou na obra
  String autorObra;
  String artistaObra; //Criador da obra
  int anoLancamentoObra;
  String comentarioObra;

  Obra({
    this.id,
    required this.capaObra,
    required this.nomeObra,
    required this.nomeAlternativoObra,
    required this.generoObra,
    required this.dataRegistroObra,
    required this.dataUpdateObra,
    required this.colecaoScanObra,
    required this.sinopseObra,
    required this.temCorObra,
    required this.maiorIdadeObra,
    required this.statusObra,
    required this.tipoObra,
    required this.envolvidosObra,
    required this.autorObra,
    required this.artistaObra,
    required this.anoLancamentoObra,
    required this.comentarioObra,
  });

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'capaObra': capaObra,
      'nomeObra': nomeObra,
      'nomeAlternativoObra' : nomeAlternativoObra,
      'generoObra' : generoObra.join(','),
      'dataRegistroObra' : dataRegistroObra,
      'dataUpdateObra' : dataUpdateObra,
      'colecaoScanObra' : colecaoScanObra,
      'sinopseObra' : sinopseObra,
      'temCorObra' : temCorObra ? 1 : 0,
      'maiorIdadeObra' : maiorIdadeObra ? 1 : 0,
      'statusObra' : statusObra,
      'tipoObra' : tipoObra,
      'envolvidosObra' : envolvidosObra,
      'autorObra' : autorObra,
      'artistaObra' : artistaObra,
      'anoLancamentoObra' : anoLancamentoObra,
      'comentarioObra' : comentarioObra,
    };
  }

  factory Obra.fromMap(Map<String, dynamic> map) {
    return Obra(
      id: map['id'] ,
      capaObra: map['capaObra'],
      nomeObra: map['nomeObra'],
      nomeAlternativoObra: map['nomeAlternativoObra'],
      generoObra: (map['generoObra'] as String).split(','),
      dataRegistroObra: map['dataRegistroObra'],
      dataUpdateObra: map['dataUpdateObra'],
      colecaoScanObra: map['colecaoScanObra'],
      sinopseObra: map['sinopseObra'],
      temCorObra: map['temCorObra'] == 1,
      maiorIdadeObra: map['maiorIdadeObra'] == 1,
      statusObra: map['statusObra'],
      tipoObra: map['tipoObra'],
      envolvidosObra: map['envolvidosObra'],
      autorObra: map['autorObra'],
      artistaObra: map['artistaObra'],
      anoLancamentoObra: map['anoLancamentoObra'],
      comentarioObra: map['comentarioObra'],
    );
  }
}

