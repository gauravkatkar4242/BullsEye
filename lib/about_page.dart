import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page")
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Back to GAME"),
        ),
      ),
    );
  }
}
