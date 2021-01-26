import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final history;

  History({Key key, this.history}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "History"
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
        child: GridView.count(
          crossAxisCount: 1,
          children: List.generate(widget.history.length, (index) {
              return Center(
                child: Text(
                  widget.history[index].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  )
                ),
              );
            }
          ),
        )
      ),
    );
  }
}
