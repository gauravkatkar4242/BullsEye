import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;

  const StyledButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      shape: CircleBorder(
        side: BorderSide(color: Colors.white)
      ),
    );
  }
}
