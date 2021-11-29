class GamePageModel{

  static const SLIDER_START = 50;
  static const SCORE_START = 0;
  static const ROUND_START = 1;

  GamePageModel(this.target, [
    this.score = SCORE_START,
    this.current = SLIDER_START,
    this.round = ROUND_START
  ]);

  int target;
  int score;
  int round;
  int current;

}