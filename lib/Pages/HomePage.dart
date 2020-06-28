import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionPage.dart';

const Color colorGreen = Color.fromRGBO(37, 152, 74, 1.0);

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

  // Future<Map>
  /*
  */
  _callBackend() async {

    Dio dio = new Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Response response = await dio.get('https://10.0.2.2:5001/questions');

    var responseBody = response.data;

    //return responseBody;

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
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text("QUIZ",
                style: TextStyle(
                    color: colorGreen,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),

            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text("Origem das Montadoras",
                style: TextStyle(
                    color: colorGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),

            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text("?",
                style: TextStyle(
                    color: colorGreen,
                    fontSize: 100,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),







            Container(
              child: RaisedButton(
                child: Text("COMEÇAR"),
                color: colorGreen,
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



                  /*
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
                      */





                },
              ),
            ),





          ],
        ),
      ),
    );
  }
}
