import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04_flashcard/flashcard_view.dart';
import 'package:flutter_04_flashcard/myflashcard.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

List<MyFlashcard> _flashcard = [
  MyFlashcard("Question 1: Which language flutter use","Dart"),
  MyFlashcard("Question 2: Which language Android use","Java"),
  MyFlashcard("Question 3:language Android use","Kotlin"),
  MyFlashcard("Question 4: language flutter use","Dart"),
];

int _indexNUmber = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 300,
                  width: 250,
                  child: FlipCard(
                    front: FlashCardView(_flashcard[_indexNUmber].question),
                    back: FlashCardView(_flashcard[_indexNUmber].answer),
                  ),
                ),
              ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlineButton.icon(
                        onPressed:movePrevious,
                        icon: Icon(Icons.chevron_left),
                        label: Text("Pre"),
                    ),

                    OutlineButton.icon(
                      onPressed: moveNext,
                      icon: Icon(Icons.navigate_next_sharp),
                      label: Text("Next"),

                    ),
                  ],
                ),
            ],

          ),
        ),
      ),
    );
  }
 void moveNext()
  {
      setState(() {
        _indexNUmber =
        _indexNUmber < _flashcard.length-1? _indexNUmber+1 : 0;
      });
  }
  void movePrevious()
  {
      setState(() {
        _indexNUmber =
        _indexNUmber-1>=0? _indexNUmber-1 : _flashcard.length-1;
      });
  }
}

