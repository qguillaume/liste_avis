import 'package:flutter/material.dart';
import '../controllers/controller_avis.dart';
import '../models/model_avis.dart';
import 'home_page.dart';

class AddAvisPage extends StatefulWidget {
  final ControllerAvis controllerAvis;

  AddAvisPage({required this.controllerAvis});

  @override
  _AddAvisPageState createState() => _AddAvisPageState();
}

class _AddAvisPageState extends State<AddAvisPage> {
  final TextEditingController _textController = TextEditingController();
  int _selectedStars = 3; // Par défaut, 3 étoiles
  bool _isPour = true; // Par défaut, "Pour"

  void _ajouterAvis() {
    if (_textController.text.isNotEmpty) {
      widget.controllerAvis.avisList.add(
        Avis(
          texte: _textController.text,
          estPour: _isPour,
          note: _selectedStars,
        ),
      );

      // Retour à la page d'accueil avec mise à jour
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(controllerAvis: widget.controllerAvis),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ajouter un Avis", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Conteneur Bleu arrondi pour le formulaire
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Titre élément",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Description",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 20),

                  // Champ de texte
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Entrez votre avis...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Sélection des étoiles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _selectedStars
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedStars = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Boutons Ajouter & Annuler
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Bouton Annuler
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Annuler",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                // Bouton Ajouter
                ElevatedButton(
                  onPressed: _ajouterAvis,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Ajouter",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
