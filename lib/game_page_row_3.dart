import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'style_button.dart';
import 'text_style.dart';
import 'dart:ui' as ui;

class GamePageRow3 extends StatelessWidget {
  GamePageRow3(
      {Key? key,
      required this.score,
      required this.round,
      required this.startNewGame})
      : super(key: key);

  final int score;
  final int round;
  ui.VoidCallback startNewGame;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StyledButton(
            onPressed: () {
              startNewGame();
            },
          icon: Icons.refresh
        ),
        Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Column(
              children: [
                Text(
                  "Score: ",
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  "$score",
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Column(
              children: [
                Text(
                  "Round: ",
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  "$round",
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            )),
        StyledButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutPage())
          );
        }, icon: Icons.info)
      ],
    );
  }
}
