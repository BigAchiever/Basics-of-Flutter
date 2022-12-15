import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funda_1/barriers.dart';
import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdy = 0; // predefining the position
  double initialPosition = birdy;
  double gravity = -4.8;
  double height = 0;
  double time = 0; //how strong the gravity is
  double velocity = 2; //Bird jump speed
  static double barrierX1 = 1;
  double barrierX2 = barrierX1 + 1.5;
  double barrierX3 = barrierX1 + 3;
  int score = 0;
  int highScore = 0;

  bool gameHasStarted = false;

  bool checkLose() {
    if (barrierX1 < 0.2 && barrierX1 > -0.2) {
      if (birdy < -0.3 || birdy > 0.7) {
        return true;
      }
    }
    if (barrierX2 < 0.2 && barrierX2 > -0.2) {
      if (birdy < -0.8 || birdy > 0.4) {
        return true;
      }
    }
    if (barrierX3 < 0.2 && barrierX3 > -0.2) {
      if (birdy < -0.4 || birdy > 0.7) {
        return true;
      }
    }
    return false;
  }

  // jumping bird
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      height = gravity * time * time + velocity * time;

      setState(() {
        birdy = initialPosition - height; // bird jumping formula
      });
      setState(() {
        if(barrierX1 < -2) {
          score++;
          barrierX1 += 4.5;
        }
        else{
          barrierX1 -= 0.04;
        }
      });

      setState(() {
        if(barrierX2 < -2) {
          score++;
          barrierX2 += 4.5;
        }
        else{
          barrierX2 -= 0.04;
        }
      });

      setState(() {
        if(barrierX3 < -2) {
          score++;
          barrierX3 += 4.5;
        }
        else{
          barrierX3 -= 0.04;
        }
      });


      if (birdIsDead() || checkLose()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialogueBox();
      }

      //keep time going
      time = time + 0.1;
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdy = 0;
      gameHasStarted = false;
      time = 0;
      initialPosition = birdy;
    });
  }

  void _showDialogueBox() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
              child: Text(
                "GAME OVER :(",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      "TRY AGAIN!",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void jump() {
    setState(() {
      time = 0; // time resets so the jump happens again
      initialPosition = birdy;
    });
  }

  bool birdIsDead() {
    //check if hits top and bottom
    if (birdy < -1 || birdy > 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      MyBird(
                        birdy: birdy,
                      ),
                      Container(
                        alignment: const Alignment(0, -0.3),
                        child: Text(
                          gameHasStarted ? "" : "T A P  T O  P L A Y !",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX1,1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX2, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 300.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX3,1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 100.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX1,-1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX2,-1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 100.0,
                        ),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(barrierX3, -1.1),
                        duration: Duration(milliseconds: 0),
                        child: const MyBarrier(
                          size: 200.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 13,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(score.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BEST",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(highScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
