import 'package:flutter/material.dart';
import 'ResultPage.dart';

const Color colorGreen = Color.fromRGBO(37, 152, 74, 1.0);

class QuestionPage extends StatefulWidget {

  /*
    Gabarito de Respostas informadas pelo Back
  */
  final List<String> backAnswers;


  /*
    Questões fornecidas pelo Back
  */
  final List<String> backQuestions;


  /*
    Respostas dadas pelo Usuário
  */
  final List<String> userAnswers;


  /*
    Número da questão atual
  */
  final questionNumber;


  QuestionPage({
    @required this.backQuestions,
    @required this.backAnswers,
    @required this.questionNumber,
    this.userAnswers, // na primeira chamada ela não é necessária
  });


  @override
  _QuestionPageState createState() => _QuestionPageState();

}

class _QuestionPageState extends State<QuestionPage> {

  String _answer;

  var _allAnswers = [
    "Inglaterra",
    "USA",
    "Alemanha",
    "Japão",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Text("QUESTÃO ${widget.questionNumber}/5",
                style: TextStyle(
                    color: colorGreen,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),



            // PERGUNTA
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(widget.backQuestions[widget.questionNumber-1],
                style: TextStyle(
                    color: colorGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),



            // ALTERNATIVAS
            Container(
              child: Column(
                children: <Widget>[


                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RadioListTile(
                        title: Text(_allAnswers[0]),
                        value: "A1", // Answer 1
                        groupValue: _answer,
                        onChanged: (String choice) {
                          setState(() {
                            _answer = choice;
                          });
                        }
                    ),
                  ),





                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RadioListTile(
                        title: Text(_allAnswers[1]),
                        value: "A2", // Answer 1
                        groupValue: _answer,
                        onChanged: (String choice) {
                          setState(() {
                            _answer = choice;
                          });
                        }
                    ),
                  ),





                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RadioListTile(
                        title: Text(_allAnswers[2]),
                        value: "A3", // Answer 1
                        groupValue: _answer,
                        onChanged: (String choice) {
                          setState(() {
                            _answer = choice;
                          });
                        }
                    ),
                  ),





                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RadioListTile(
                        title: Text(_allAnswers[3]),
                        value: "A4", // Answer 1
                        groupValue: _answer,
                        onChanged: (String choice) {
                          setState(() {
                            _answer = choice;
                          });
                        }
                    ),
                  ),








                ],
              ),
            ),





            Container(
              child: RaisedButton(
                child: Text("AVANÇAR"),
                color: colorGreen,
                textColor: Colors.white,
                onPressed: (){

                  // SE O USUÁRIO SELECIONOU UMA RESPOSTA
                  if (_answer != null) {

                    List<String> _answersUser = widget.userAnswers;

                    /*
                      Taxa de acerto (de 0 a 5)
                      Ela vai ser utilizada apenas no final
                    */
                    int _hitRate = 0;



                    // SE FOR A QUESTION 1
                    if (widget.questionNumber == 1) {
                      _answersUser = [_answer];
                    }

                    // SE FOR A QUESTION 2, 3, ou 4
                    else if (widget.questionNumber >= 2 &&
                        widget.questionNumber <= 4) {
                      _answersUser.add(_answer);
                    }

                    // SE FOR A QUESTION 5
                    else if (widget.questionNumber == 5) {

                      _answersUser.add(_answer);

                      /*
                        Acredito que esse lógica deveria
                        estar no backend, porém para simplificar,
                        resolvi colocar aqui. Posteriormente,
                        em uma segunda versão do código, irei
                        colocá-la no back.
                      */
                      print("Perguntas: " + widget.backQuestions.toString());
                      print("Respostas do Usuário: " + widget.userAnswers.toString());
                      print("Gabarito: " + widget.backAnswers.toString());

                      for (var i = 0; i <= 4; i++) {
                        if (widget.backAnswers[i] == widget.userAnswers[i])
                          _hitRate += 1;
                      }
                    }

                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {

                            if (widget.questionNumber < 5)
                              return QuestionPage(
                                questionNumber: widget.questionNumber + 1,
                                backAnswers: widget.backAnswers,
                                backQuestions: widget.backQuestions,
                                userAnswers: _answersUser,
                              );


                            else
                              return ResultPage(answerResult: _hitRate,);
                          }
                      ),
                    );
                  }

                  // SE O USUÁRIO NÃO SELECIONOU NENHUMA RESPOSTA
                  else {
                    print("RESPOSTA NULA");
                  }


                },
              ),
            ),



          ],
        ),

      ),
    );
  }


}
