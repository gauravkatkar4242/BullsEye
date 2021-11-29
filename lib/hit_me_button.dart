import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HitMeButton extends StatelessWidget {


  HitMeButton({required this.text, required this.onPressed});
  final GestureTapCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.red[700],
      splashColor: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.white),
      ),
    );
  }
}
