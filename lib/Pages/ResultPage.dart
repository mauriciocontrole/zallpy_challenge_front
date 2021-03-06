import 'package:flutter/material.dart';
import 'package:zallpychallengefront/ResultWidgets/BadResultWidget.dart';
import 'package:zallpychallengefront/ResultWidgets/GoodResultWidget.dart';
import 'package:zallpychallengefront/colors/ColorsApp.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {

  final int answerResult; //

  ResultPage({
    @required this.answerResult
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  void initState() {

    print(widget.answerResult);

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container(
              child: Text(
                "Você acertou ${widget.answerResult*20}% das respostas.",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'FredokaOne',
                  fontSize: 20
                ),
              ),
            ),

            //definir logica de exibição de widgets a partir de answerResult

            Container(
                child: widget.answerResult <= 2 == true ? BadResultWidget() : GoodResultWidget()
            ),


            Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.green,
                child: Text(
                  "VOLTAR PARA O INÍCIO",
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                    ),
                ),
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
