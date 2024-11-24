import 'package:calculator_app/utils/app_color.dart';
import 'package:calculator_app/utils/app_size.dart';
import 'package:calculator_app/utils/app_style.dat.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widget/custom_button.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }
  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }
  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.scaffoldColor,
      body: Container(
        padding: const EdgeInsets.all(AppSize.size12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.only(right:AppSize.size12),
                child: Text(
                  _history,
                  style:AppStyle.historyStyle
                ),
              ),
            ),
            Container(
              alignment:const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(AppSize.size12),
                child: Text(
                  _expression,
                  style:AppStyle.expersionStyle
                ),
              ),
            ),
            const SizedBox(
                height: 40
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  textSize: 20,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  callback: numClick,
                  textSize: 28,
                ),
                CalcButton(
                  text: '=',
                  fillColor:AppColor.buttonFillColor,
                  textColor:AppColor.textColor,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}