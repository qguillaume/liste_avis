import 'package:flutter/material.dart';
import '../controllers/controller_avis.dart';
import '../widgets/avis.dart';

class ResultatsPage extends StatelessWidget {
  final ControllerAvis controllerAvis;

  const ResultatsPage({Key? key, required this.controllerAvis})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avisPour =
        controllerAvis.avisList.where((avis) => avis.estPour).toList();
    final avisContre =
        controllerAvis.avisList.where((avis) => !avis.estPour).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Résultats"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colonne Contre
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contre",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  ...avisContre.map((avis) => AvisWidget(avis: avis)).toList(),
                ],
              ),
            ),
            SizedBox(width: 20),
            // Colonne Pour
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pour",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  ...avisPour.map((avis) => AvisWidget(avis: avis)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
