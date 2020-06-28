import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BadResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Você tem mais uma oportunidade.",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ],),
    );
  }
}