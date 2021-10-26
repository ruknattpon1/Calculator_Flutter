import 'package:calculator_project/modelButton/padKeyButton.dart';
import 'package:flutter/material.dart';

class calculatorScreen extends StatefulWidget {
  const calculatorScreen({Key? key}) : super(key: key);

  @override
  _calculatorScreenState createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<calculatorScreen> {
  String showresult = '0';
  double num1 = 0;
  double num2 = 0;

  String result = '';
  String finalResult = '';
  dynamic operator = '';
  dynamic history = '';
  dynamic preoperator = '';

  void btnonclick(String btnVal) {
    print(btnVal);

    if (btnVal == 'AC') {
      showresult = '0';
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preoperator = '';
      history = '';
    } else if (preoperator == '=' && btnVal == '=') {
      if (preoperator == '+') {
        finalResult = add();
      } else if (preoperator == '-') {
        finalResult = sub();
      } else if (preoperator == 'x') {
        finalResult = mul();
      } else if (preoperator == '÷') {
        finalResult = div();
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '÷' ||
        btnVal == '=') {
      if (num1 == 0) {
        num1 = double.parse(result);
      } else {
        num2 = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '÷') {
        finalResult = div();
      }
      preoperator = operator;
      operator = btnVal;
      result = '';
    } else if (btnVal == '%') {
      result = (num1 / 100).toString();
      finalResult = doContainDecimal(result);
    } else if (btnVal == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnVal == '⌫') {
      result = result.substring(0, result.length - 1);
      finalResult = result;
      if (result.length < 1) {
        finalResult = '0';
      }
    } else if (btnVal == '+/-') {
      if (result.toString().startsWith('-')) {
        result = result.toString().substring(1);
      } else {
        result = '-' + result.toString();
      }
      finalResult = result;
    } else {
      result = result + btnVal;
      finalResult = result;
    }
    setState(() {
      showresult = finalResult;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return doContainDecimal(result);
  }

  String sub() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return doContainDecimal(result);
  }

  String mul() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return doContainDecimal(result);
  }

  String div() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return doContainDecimal(result);
  }

  String doContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> spDecimal = result.toString().split('.');
      if (!(int.parse(spDecimal[1]) > 0))
        return result = spDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          showresult,
                          style: TextStyle(fontSize: 48),
                        ),
                      ),
                      alignment: Alignment(1, 1),
                    )
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF22252D)),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      padkeyButton(
                        textnumPad: 'AC',
                        textColor: Color(0xFF26FBD4),
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '+/-',
                        textColor: Color(0xFF26FBD4),
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '%',
                        textColor: Color(0xFF26FBD4),
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '÷',
                        textColor: Color(0xFFEB6666),
                        callback: btnonclick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      padkeyButton(
                        textnumPad: '7',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '8',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '9',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: 'x',
                        textColor: Color(0xFFEB6666),
                        callback: btnonclick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      padkeyButton(
                        textnumPad: '4',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '5',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '6',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '-',
                        textColor: Color(0xFFEB6666),
                        callback: btnonclick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      padkeyButton(
                        textnumPad: '1',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '2',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '3',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '+',
                        textColor: Color(0xFFEB6666),
                        callback: btnonclick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      padkeyButton(
                        textnumPad: '⌫',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '0',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '.',
                        textColor: Colors.white,
                        callback: btnonclick,
                      ),
                      padkeyButton(
                        textnumPad: '=',
                        textColor: Colors.white,
                        callback: btnonclick,
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF292D36),
              ),
            )
          ],
        ),
      ),
    );
  }
}
