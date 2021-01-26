import 'package:flutter/material.dart';

import 'dart:io';

import 'package:workshop_flutter/game/game.dart';
import 'package:workshop_flutter/history/history.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> _history = [];

  _GetHistory(int nextValue)
  {
    setState(() {
      _history.add(nextValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Roll a dice",
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
              ]
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 3 / 2,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game(
                        sendRoll: _GetHistory
                    )),
                  );
                },
                child: Text(
                  "Play",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3,
                    vertical: 16
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 3 / 2
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History(history: _history,)),
                  );
                },
                child: Text(
                  "History",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3,
                    vertical: 16
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                exit(0);
              },
              child: Text(
                "Leave",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3,
                  vertical: 16
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.white,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
