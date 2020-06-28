import 'package:flutter/material.dart';

class GoodResultWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          Text("Você acertou a maioria das questões."),

          Container(
            child: Image.asset("images/good_result.png"),
          )
        ],
      ),
    );
  }

  GoodResultWidget();
}
