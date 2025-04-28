import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../controllers/controller_avis.dart';
import '../models/model_avis.dart';
import '../widgets/avis.dart';
import 'add_avis_page.dart';
import 'resultats_page.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  final ControllerAvis controllerAvis;

  const HomePage({Key? key, required this.controllerAvis}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Avis> _avisList;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _avisList = List.from(widget.controllerAvis.avisList); // Copie des données
  }

  void _handleSwipe(CardSwiperDirection direction) {
    if (_currentIndex >= _avisList.length) return;

    bool estPour = direction == CardSwiperDirection.right;

    Avis original = _avisList[_currentIndex];
    Avis modifie = original.copyWith(estPour: estPour);

    // Mise à jour de la liste principale
    widget.controllerAvis.avisList[_currentIndex] = modifie;

    setState(() {
      _currentIndex++;
    });

    if (_currentIndex >= _avisList.length) {
      // Toutes les cartes ont été swipées
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (_) => ResultatsPage(controllerAvis: widget.controllerAvis),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:
          _avisList.isEmpty
              ? Center(child: Text("Aucun avis disponible"))
              : CardSwiper(
                cardsCount: _avisList.length,
                cardBuilder: (context, index) {
                  return AvisWidget(avis: _avisList[index]);
                },
                numberOfCardsDisplayed: 3,
                onSwipe: (previousIndex, currentIndex, direction) {
                  _handleSwipe(direction);
                },
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => AddAvisPage(controllerAvis: widget.controllerAvis),
            ),
          );
        },
        label: Text("Nouvel élément"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
