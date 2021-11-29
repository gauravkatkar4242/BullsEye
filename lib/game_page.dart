import 'dart:math';

import 'package:bulls_eye/game_page_row_1.dart';
import 'package:bulls_eye/game_page_row_2.dart';
import 'package:bulls_eye/game_page_row_3.dart';
import 'package:bulls_eye/hit_me_button.dart';
import 'package:bulls_eye/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style_button.dart';
import 'game_page_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isAlertVisible = false;
  late GamePageModel _model;

  @override
  void initState() {
    super.initState();
    _model = GamePageModel(_newTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("images/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: const Text("Game Page"),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 48.0, bottom: 32.0),
                child: GamePageRow1(targetValue: _model.target),
              ),
              GamePageRow2(model: _model),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: HitMeButton(
                    onPressed: () {
                      _showAlert(context);
                      _isAlertVisible = true;
                    },
                    text: "Press me"
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GamePageRow3(round: _model.round,
                    score: _model.score,
                    startNewGame: _startNewGame),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setScoreAndRound() {
    _model.score += _pointsForCurrentRound();
    _model.round += 1;
  }

  void _setTargetValue() {
    _model.target = _newTargetValue();
  }

  int _pointsForCurrentRound() {
    // return 100 - (max(_model.current, _model.target) - min(_model.current, _model.target));
    const MAXPOINTS = 100;
    int difference = _getDifference();
    int bonus = 0;
    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return MAXPOINTS - difference + bonus;
  }

  //ALERT BOX
  void _showAlert(BuildContext context) {
    Widget okButton = TextButton(
        child: const Text("Dismiss"),
        onPressed: () {
          Navigator.of(context).pop();
          _isAlertVisible = false;
          print("Dismiss Pressed");
          setState(() {
            _setScoreAndRound();
            _setTargetValue();
          });
        });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_getAlertTitle(),
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "THE SLIDER'S VALUE IS",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${_model.current}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),

                Text(
                  "You Scored ${_pointsForCurrentRound()} points in this Round.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[okButton],
            elevation: 5,
          );
        });
  }
    void _startNewGame() {
      setState(() {
        _model.current = GamePageModel.SLIDER_START;
        _model.round = GamePageModel.ROUND_START;
        _model.score = GamePageModel.SCORE_START;
        _model.target = _newTargetValue();
      });
    }


    String _getAlertTitle() {
      String title;
      var difference = _getDifference();
      if (difference == 0) {
        title = "Perfect..!";
      } else if (difference < 5) {
        title = "You almost had it.";
      } else if (difference < 10) {
        title = "Not Bad.";
      } else {
        title = "Not Even Close.";
      }
      return title;
    }

    int _getDifference() => (_model.target - _model.current).abs();
    int _newTargetValue() => Random().nextInt(100) + 1;

}