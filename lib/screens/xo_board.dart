import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/custom_xo_button.dart';

class XoBoard extends StatelessWidget {
  const XoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  child: const Text(
                    '00:05',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Player 1's Turn",
                  style: TextStyle(
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
                      const Column(
                        children: [
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(text: 'X'),
                              CustomXoButton(text: 'O'),
                              CustomXoButton(text: 'X'),
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(text: 'X'),
                              CustomXoButton(text: 'O'),
                              CustomXoButton(text: 'X'),
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              CustomXoButton(text: 'X'),
                              CustomXoButton(text: 'O'),
                              CustomXoButton(text: 'X'),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
