class Avis {
  final String texte;
  bool estPour;
  final int note;

  Avis({required this.texte, required this.estPour, required this.note});

  Avis copyWith({String? texte, bool? estPour, int? note}) {
    return Avis(
      texte: texte ?? this.texte,
      estPour: estPour ?? this.estPour,
      note: note ?? this.note,
    );
  }
}
