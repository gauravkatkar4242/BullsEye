import 'package:flutter/cupertino.dart';
import 'text_style.dart';
class GamePageRow1 extends StatelessWidget {

  GamePageRow1({required this.targetValue});

   final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  <Widget>[
        Text("PUT THE BULLS EYE AS CLOSE AS YOU CAN",
         style: LabelTextStyle.bodyText1(context),),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
             "$targetValue",
              style: TargetTextStyle.bodyText1(context),),
         ),
      ],
      
    );
  }
}
