import 'package:flutter/material.dart';
import 'package:zallpychallengefront/colors/ColorsApp.dart';
import 'ResultPage.dart';

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

      backgroundColor: colorDarkBlue,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text("QUESTÃO ${widget.questionNumber}/5",
              style: TextStyle(
                fontFamily: 'FredokaOne',
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),



          // PERGUNTA
          Container(
            padding: EdgeInsets.only(left: 35, right: 5),
            child: Text(widget.backQuestions[widget.questionNumber-1],
              style: TextStyle(
                fontFamily: 'FredokaOne',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),



          // ALTERNATIVAS
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              children: <Widget>[
                RadioListTile(
                  title: Text(
                    _allAnswers[0],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: "A1", // Answer 1
                  groupValue: _answer,
                  onChanged: (String choice) {
                    setState(() {
                      _answer = choice;
                    });
                  },
                ),




                RadioListTile(
                    title: Text(
                      _allAnswers[1],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: "A2", // Answer 1
                    groupValue: _answer,
                    onChanged: (String choice) {
                      setState(() {
                        _answer = choice;
                      });
                    }
                ),





                RadioListTile(
                    title: Text(
                      _allAnswers[2],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: "A3", // Answer 1
                    groupValue: _answer,
                    onChanged: (String choice) {
                      setState(() {
                        _answer = choice;
                      });
                    }
                ),




                RadioListTile(
                    title: Text(
                      _allAnswers[3],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: "A4", // Answer 1
                    groupValue: _answer,
                    onChanged: (String choice) {
                      setState(() {
                        _answer = choice;
                      });
                    }
                ),
              ],
            ),
          ),





          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("AVANÇAR"),
              color: Colors.green,
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
    );
  }


}
