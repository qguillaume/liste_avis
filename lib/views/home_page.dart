import 'package:flutter/material.dart';
import '../widgets/avis.dart';
import '../widgets/bottom_navbar.dart';
import '../controllers/controller_avis.dart';
import 'add_avis_page.dart';

class HomePage extends StatefulWidget {
  final ControllerAvis controllerAvis;

  HomePage({Key? key, required this.controllerAvis}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Liste des avis",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colonne Rouge (Contre)
                  Expanded(
                    child: Column(
                      children:
                          widget.controllerAvis.avisList
                              .where((avis) => !avis.estPour)
                              .map((avis) => AvisWidget(avis: avis))
                              .toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Colonne Verte (Pour)
                  Expanded(
                    child: Column(
                      children:
                          widget.controllerAvis.avisList
                              .where((avis) => avis.estPour)
                              .map((avis) => AvisWidget(avis: avis))
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigation vers la page d'ajout d'avis
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          AddAvisPage(controllerAvis: widget.controllerAvis),
                ),
              ).then((_) {
                // Rafraîchir la page après l'ajout d'un avis
                setState(() {});
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              "Nouvelle élément",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          BottomNavbar(),
        ],
      ),
    );
  }
}
