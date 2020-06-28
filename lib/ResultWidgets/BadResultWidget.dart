import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BadResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Você vai melhorar!",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'FredokaOne',
                color: Colors.white
            ),
          ),
          Image.asset(
            'images/bad_result.png',
            color: Colors.white,
          ),
          Text(
            "Tente novamente",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'FredokaOne',
                color: Colors.white
            ),
          ),
        ],),
    );
  }
}