import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/custom_xo_button.dart';

class XoBoard extends StatefulWidget {
  XoBoard({super.key});

  @override
  State<XoBoard> createState() => _XoBoardState();
}

class _XoBoardState extends State<XoBoard> {
  String curPlayer = "x";
  List<String> board = List.filled(9, "");
  bool gameOver = false;
  String winner = "";
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch()..start(); // Ensure the stopwatch is initialized and started
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
  }

  void onButtonClick(int index) {
    if (board[index].isEmpty && !gameOver) {
      board[index] = curPlayer;
      if (checkWinner()) {
        winner = curPlayer;
        gameOver = true;
        _stopwatch.stop();
      } else if (board.every((cell) => cell.isNotEmpty)) {
        gameOver = true;
        winner = "Draw";
        _stopwatch.stop();
      } else {
        curPlayer = curPlayer == "x" ? "o" : "x";
      }
      setState(() {});
    }
  }

  bool checkWinner() {
    return checkWinnerHorizontal() || checkWinnerVertical() || checkWinnerDiagonal();
  }

  bool checkWinnerVertical() {
    for (int i = 0; i < 3; i++) {
      if (board[i] == board[i + 3] &&
          board[i] == board[i + 6] &&
          board[i].isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool checkWinnerHorizontal() {
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == board[i + 1] &&
          board[i] == board[i + 2] &&
          board[i].isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool checkWinnerDiagonal() {
    if (board[0] == board[4] &&
        board[0] == board[8] &&
        board[0].isNotEmpty) {
      return true;
    }
    if (board[2] == board[4] &&
        board[2] == board[6] &&
        board[2].isNotEmpty) {
      return true;
    }
    return false;
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, "");
      curPlayer = "x";
      gameOver = false;
      winner = "";
      _stopwatch.reset();
      _stopwatch.start();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String minutesStr = (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0');
    String secondsStr = (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.cyan,
              Colors.blue,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  width: size.width,
                  child: Text(
                    '$minutesStr:$secondsStr',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (gameOver)
                  Text(
                    winner == "Draw" ? "It's a Draw!" : "Player ${winner == "x" ? "1" : "2"} Wins!",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  )
                else
                  Text(
                    "Player ${curPlayer == "x" ? "1" : "2"}'s Turn",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                const SizedBox(height: 8),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(
                                text: board[0],
                                onPress: () {
                                  onButtonClick(0);
                                },
                              ),
                              CustomXoButton(
                                text: board[1],
                                onPress: () {
                                  onButtonClick(1);
                                },
                              ),
                              CustomXoButton(
                                text: board[2],
                                onPress: () {
                                  onButtonClick(2);
                                },
                              ),
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(
                                text: board[3],
                                onPress: () {
                                  onButtonClick(3);
                                },
                              ),
                              CustomXoButton(
                                text: board[4],
                                onPress: () {
                                  onButtonClick(4);
                                },
                              ),
                              CustomXoButton(
                                text: board[5],
                                onPress: () {
                                  onButtonClick(5);
                                },
                              ),
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(
                                text: board[6],
                                onPress: () {
                                  onButtonClick(6);
                                },
                              ),
                              CustomXoButton(
                                text: board[7],
                                onPress: () {
                                  onButtonClick(7);
                                },
                              ),
                              CustomXoButton(
                                text: board[8],
                                onPress: () {
                                  onButtonClick(8);
                                },
                              ),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: resetGame,
                  child: const Text('Reset Game'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
