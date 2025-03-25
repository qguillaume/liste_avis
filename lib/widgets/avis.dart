import 'package:flutter/material.dart';
import '../models/model_avis.dart';

class AvisWidget extends StatelessWidget {
  final Avis avis;

  AvisWidget({required this.avis});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: avis.estPour ? Colors.green[300] : Colors.red[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            avis.texte,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < avis.note ? Icons.star : Icons.star_border,
                color: index < avis.note ? Colors.yellow : Colors.white,
                size: 16,
              );
            }),
          ),
        ],
      ),
    );
  }
}
