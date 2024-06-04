class Scan {
  int? id;
  int obraId;
  String nomeCapitulo;
  String dataRgistro;
  String statusCapitulo;
  String arquivoCapitulo;

  Scan({
    this.id,
    required this.obraId,
    required this.nomeCapitulo,
    required this.dataRgistro,
    required this.statusCapitulo,
    required this.arquivoCapitulo,
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'obraId' : obraId,
      'nomeCapitulo' : nomeCapitulo,
      'dataRegistro' : dataRgistro,
      'statusCapitulo' : statusCapitulo,
      'arquivoCapitulo' : arquivoCapitulo
    };
  }

  factory Scan.fromMap(Map<String, dynamic> map){
    return Scan(
        obraId: map['obraId'],
        nomeCapitulo: map['nomeCapitulo'],
        dataRgistro: map['dataRgistro'],
        statusCapitulo: map['statusCapitulo'],
        arquivoCapitulo: map['arquivoCapitulo'],
    );
  }
}