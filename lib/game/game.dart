import 'package:flutter/material.dart';

import 'dart:math';

class Game extends StatefulWidget {
  final sendRoll;

  Game({Key key, this.sendRoll}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int resultRoll = -1;

  var rng = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Roll"
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.yellow,
                  Colors.redAccent
                ]
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[
              Colors.yellow,
              Colors.redAccent
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 3 / 2,
              ),
              child: Text(
                resultRoll == -1 ? "Roll Please" : resultRoll.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 3 / 2,
              ),
              child: ClipOval(
                child: Material(
                  color: Color.fromARGB(130, 220, 220, 220), // button color
                  child: InkWell(
                    splashColor: Colors.green, // inkwell color
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.autorenew_outlined,
                        color: Colors.white,
                        size: 50,
                      )
                    ),
                    onTap: () {
                      setState(() {
                        resultRoll = rng.nextInt(100);
                        widget.sendRoll(resultRoll);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
