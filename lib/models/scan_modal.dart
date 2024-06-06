class Scan {
  int? id;
  int obraId;
  String nomeCapitulo;
  String dataRgistro;
  String statusCapitulo;
  List<String> arquivoCapitulo;

  Scan({
    this.id,
    required this.obraId,
    required this.nomeCapitulo,
    required this.dataRgistro,
    required this.statusCapitulo,
    required this.arquivoCapitulo,
  });

  factory Scan.fromMap(Map<String, dynamic> map){
    return Scan(
      id: map['id'],
      obraId: map['obraId'],
      nomeCapitulo: map['nomeCapitulo'],
      dataRgistro: map['dataRgistro'],
      statusCapitulo: map['statusCapitulo'],
      arquivoCapitulo: (map['arquivoCapitulo'] as String).split(','),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'obraId' : obraId,
      'nomeCapitulo' : nomeCapitulo,
      'dataRgistro' : dataRgistro,
      'statusCapitulo' : statusCapitulo,
      'arquivoCapitulo' : arquivoCapitulo.join(','),
    };
  }

}