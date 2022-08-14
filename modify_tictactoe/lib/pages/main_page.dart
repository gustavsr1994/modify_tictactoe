import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 1st player is O
  List<String> displayStart = ['', '', '', '', '', '', '', '', ''];
  List<String> displayElement = ['I', 'N', 'C', 'D', 'U', 'Z', 'N', 'A', 'S'];
  List<String> wordWinner = ['U', 'N', 'N', 'I', 'S'];
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                    displayStart[index],
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped(int index) {
    setState(() {
      displayStart[index] = displayElement[index];
    });
    for (var item in displayStart) {
      print("Item : $item");
      for (var index = 0; index < wordWinner.length; index++) {
        if (item == wordWinner[index]) {
          filledBoxes++;
          wordWinner[index] = '-';
        }
      }
    }
    print("Count $filledBoxes");
    if (filledBoxes == 5) {
      _showWinDialog();
    }
  }

  // void _checkWinner() {
  //   // Checking rows
  //   if (displayElement[0] == displayElement[1] &&
  //       displayElement[0] == displayElement[2] &&
  //       displayElement[0] != '') {
  //     _showWinDialog(displayElement[0]);
  //   }
  //   if (displayElement[3] == displayElement[4] &&
  //       displayElement[3] == displayElement[5] &&
  //       displayElement[3] != '') {
  //     _showWinDialog(displayElement[3]);
  //   }
  //   if (displayElement[6] == displayElement[7] &&
  //       displayElement[6] == displayElement[8] &&
  //       displayElement[6] != '') {
  //     _showWinDialog(displayElement[6]);
  //   }

  //   // Checking Column
  //   if (displayElement[0] == displayElement[3] &&
  //       displayElement[0] == displayElement[6] &&
  //       displayElement[0] != '') {
  //     _showWinDialog(displayElement[0]);
  //   }
  //   if (displayElement[1] == displayElement[4] &&
  //       displayElement[1] == displayElement[7] &&
  //       displayElement[1] != '') {
  //     _showWinDialog(displayElement[1]);
  //   }
  //   if (displayElement[2] == displayElement[5] &&
  //       displayElement[2] == displayElement[8] &&
  //       displayElement[2] != '') {
  //     _showWinDialog(displayElement[2]);
  //   }

  //   // Checking Diagonal
  //   if (displayElement[0] == displayElement[4] &&
  //       displayElement[0] == displayElement[8] &&
  //       displayElement[0] != '') {
  //     _showWinDialog(displayElement[0]);
  //   }
  //   if (displayElement[2] == displayElement[4] &&
  //       displayElement[2] == displayElement[6] &&
  //       displayElement[2] != '') {
  //     _showWinDialog(displayElement[2]);
  //   } else if (filledBoxes == 9) {
  //     _showDrawDialog();
  //   }
  // }

  void _showWinDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Congratulation :) You are a Winner!!!"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  // _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
