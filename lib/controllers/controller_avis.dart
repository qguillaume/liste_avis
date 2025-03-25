import '../models/model_avis.dart';

class ControllerAvis {
  List<Avis> avisList = [
    Avis(texte: "Je suis contre cette idée", estPour: false, note: 2),
    Avis(texte: "C'est une excellente initiative", estPour: true, note: 5),
    Avis(texte: "Pas du tout d'accord", estPour: false, note: 1),
    Avis(texte: "Cela va vraiment aider", estPour: true, note: 4),
    Avis(texte: "Bonne intention mais à revoir", estPour: false, note: 3),
    Avis(texte: "Parfaitement d'accord", estPour: true, note: 5),
  ];
}
