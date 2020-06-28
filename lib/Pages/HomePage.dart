import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zallpychallengefront/colors/ColorsApp.dart';
import 'QuestionPage.dart';


class HomePage extends StatefulWidget {
  /*
  final List<String> _backQuestions = [
    "Qual é a origem da BMW?",
    "Qual é a origem da Toyota?",
    "Qual é a origem da Mini?",
    "Qual é a origem da General Motors?",
    "Qual é a origem da Rolls-Royce?",
  ];

  final List<String> _backAnswers = [
    "A3",
    "A4",
    "A1",
    "A2",
    "A1",
  ];
  */
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _backQuestions = [];
  List<String> _backAnswers = [];

  _callBackend() async {

    Dio dio = new Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Response response = await dio.get('https://10.0.2.2:5001/questions');

    var responseBody = response.data;

    print(responseBody.toString());

    _backQuestions = [
      responseBody[0]["questionBody"],
      responseBody[1]["questionBody"],
      responseBody[2]["questionBody"],
      responseBody[3]["questionBody"],
      responseBody[4]["questionBody"],
    ];

    _backAnswers = [
      responseBody[0]["answerCorrect"],
      responseBody[1]["answerCorrect"],
      responseBody[2]["answerCorrect"],
      responseBody[3]["answerCorrect"],
      responseBody[4]["answerCorrect"],
    ];
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "QUIZ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FredokaOne',
                  color: Colors.lightBlue,
                  fontSize: 50,
                ),
              ),

            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "Origem das Montadoras",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'FredokaOne'
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.9),
                      spreadRadius: 60,
                      blurRadius: 60,
                    )
                  ]
              ),
              child: ClipOval(
                child: Image.asset("images/car2.png"),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("COMEÇAR"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  _callBackend().then((result) {
                    print('In Builder');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionPage(
                            questionNumber: 1,
                            backQuestions: _backQuestions,
                            backAnswers: _backAnswers,
                          )
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
