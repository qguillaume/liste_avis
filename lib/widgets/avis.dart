import 'package:flutter/material.dart';
import '../models/model_avis.dart';

class AvisWidget extends StatelessWidget {
  final Avis avis;

  AvisWidget({required this.avis});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Titre élément",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              avis.texte,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < avis.note ? Icons.star : Icons.star_border,
                  color: Colors.white,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
