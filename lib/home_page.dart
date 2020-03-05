

import 'package:fluttercalculator/main.dart';
import 'package:fluttercalculator/math.dart';
import 'package:flutter/material.dart';
import 'key_item.dart';
Color primaryColor = Colors.grey[100];
void main() => runApp(MaterialApp(
  home: new HomePage(),
  theme: new ThemeData(primaryColor: Colors.grey[100]),
));
class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}
class HomePageState extends State<HomePage> {

  var width;
  var height;
  static bool reset;
  bool secondNumber = false;
  bool plusMinus = false;
  bool percentage = false;
  bool equal = true;
  static List firstValue = List();
  static List secondValue = List();
  static double doubleValue;
  static double calculatedValue;
  Key _actionKey;
  Key _plusKey = Key('plus');
  Key _minusKey = Key('minus');
  Key _multiplyKey = Key('multiply');
  Key _divideKey = Key('divide');
  Key _sevenKey = Key('seven');
  Key _eightKey = Key('eight');
  Key _nineKey = Key('nine');
  Key _fourKey = Key('four');
  Key _fiveKey = Key('five');
  Key _sixKey = Key('six');
  Key _oneKey = Key('one');
  Key _twoKey = Key('two');
  Key _threeKey = Key('three');
  Key _dotKey = Key('dot');
  Key _zeroKey = Key('zero');
  Key _allClearKey = Key('allclear');
  Key _equalsKey = Key('equals');
  Key _plusminus = Key('plusorminus');
  Key _percentage = Key('percent');
  Key _doubleZero = Key('doubleZero');
  TextEditingController _firstNumberController = new TextEditingController();
  TextEditingController _resultController = new TextEditingController(text: "0");
  TextEditingController _actionController = new TextEditingController();
  TextEditingController _secondNumberController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
    void onKeyTapped(Key key) {
      setState(() {
        if (identical(_allClearKey, key)) {
          firstValue.clear();
          _firstNumberController.clear();
          _resultController.clear();
          secondValue.clear();
          _secondNumberController.clear();
          _actionController.clear();
          secondNumber = false;
        }
        else if (identical(_plusminus, key)) {
          if (secondValue.length == 0) {
            doubleValue = double.parse(convertToString(firstValue)) * -1;
            firstValue.clear();
            _firstNumberController.text = validateDouble(doubleValue);
            firstValue.add(validateDouble(doubleValue));
            _actionController.clear();
          }
          else {
            plusMinus = true;
            checkSign(_actionController.text);
          }
        }
        else if (identical(_percentage, key)) {
          if (secondValue.length == 0) {
            doubleValue = double.parse(convertToString(firstValue)) / 100;
            firstValue.clear();
            _firstNumberController.text = validateDouble(doubleValue);
            firstValue.add(validateDouble(doubleValue));
            _actionController.clear();
          }
          else {
            percentage =  true;
            checkSign(_actionController.text);
          }
        }
        else if (identical(_divideKey, key)) {
          if (firstValue.length > 0) {
            _actionController.text = "/";
            secondNumber = true;
          }
        }
        else if (identical(_sevenKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("7");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("7");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_eightKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("8");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("8");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_nineKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("9");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("9");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_multiplyKey, key)) {
          if (firstValue.length > 0) {
            _actionController.text = "*";
            secondNumber = true;
          }
        }
        else if (identical(_fourKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("4");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("4");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_fiveKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("5");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("5");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_sixKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("6");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("6");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_plusKey, key)) {
          if (firstValue.length > 0) {
            _actionController.text = "+";
            secondNumber = true;
          }
        }
        else if (identical(_oneKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("1");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("1");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_twoKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("2");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("2");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_threeKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("3");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("3");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_minusKey, key)) {
          if (firstValue.length > 0) {
            _actionController.text = "-";
            secondNumber = true;
          }
        }
        else if (identical(_doubleZero, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("00");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("00");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_zeroKey, key)) {
          if (reset == true) {
            resetAction();
          }
          if (secondNumber == false) {
            firstValue.add("0");
            _firstNumberController.text = convertToString(firstValue);
          }
          else {
            secondValue.add("0");
            _secondNumberController.text = convertToString(secondValue);
          }
        }
        else if (identical(_dotKey, key)) {
          if (reset == true) {
            resetAction();
            firstValue.add("0");
            firstValue.add(".");
            _firstNumberController.text = convertToString(firstValue);
            _resultController.clear();
          }
          if (secondNumber == false) {
            if (!firstValue.contains(".")) {
              firstValue.add(".");
              _firstNumberController.text = convertToString(firstValue);
            }
          }
          else {
            if (!secondValue.contains(".")) {
              secondValue.add(".");
              _secondNumberController.text = convertToString(secondValue);
            }
          }
        }
        else if (identical(_equalsKey, key)) {
          if (secondValue.length == 0) {
            print(convertToString(firstValue));
            _resultController.text = convertToString(firstValue);
            _firstNumberController.clear();
            reset = true;
          }
          else {
            equal = true;
            checkSign(_actionController.text);
          }
        }
      });
    }

    KeyItem buildKeyItem(String val, Key key, Color colors) {
      return KeyItem(
        key: key,
        child: Text(
          val,
          style: TextStyle(
              color: colors,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
        onKeyTap: onKeyTapped,
      );
    }
    return new Scaffold(
      backgroundColor: primaryColor,
      appBar: new AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Calc',
            style: TextStyle(fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: '.', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: width,
            height: (height / 100) * 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    width: width,
                    padding: EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color:Colors.red,
                            child: TextField(
                              enabled: true,
                              autofocus: false,
                              controller: _firstNumberController,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontStyle: FontStyle.normal,
                                color: Colors.grey,
                                fontSize: 25.0,
                              ),
                              decoration: InputDecoration.collapsed(
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: TextField(
                              enabled: true,
                              autofocus: false,
                              controller: _actionController,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 25.0,
                              ),
                              decoration: InputDecoration.collapsed(
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              enabled: true,
                              autofocus: false,
                              controller: _secondNumberController,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontStyle: FontStyle.normal,
                                color: Colors.grey,
                                fontSize: 25.0,
                              ),
                              decoration: InputDecoration.collapsed(
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: TextField(
                    enabled: true,
                    autofocus: false,
                    controller: _resultController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40.0,
                    ),
                    decoration: InputDecoration.collapsed(
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildKeyItem("C", _allClearKey, Colors.grey),
                        buildKeyItem("+/-", _plusminus, Colors.grey),
                        buildKeyItem("%", _percentage, Colors.grey),
                        buildKeyItem("/", _divideKey, Colors.red),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildKeyItem("7", _sevenKey, Colors.black),
                        buildKeyItem("8", _eightKey, Colors.black),
                        buildKeyItem("9", _nineKey, Colors.black),
                        buildKeyItem("*", _multiplyKey, Colors.red)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildKeyItem("4", _fourKey, Colors.black),
                        buildKeyItem("5", _fiveKey, Colors.black),
                        buildKeyItem("6", _sixKey, Colors.black),
                        buildKeyItem("+", _plusKey, Colors.red)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildKeyItem("1", _oneKey, Colors.black),
                        buildKeyItem("2", _twoKey, Colors.black),
                        buildKeyItem("3", _threeKey, Colors.black),
                        buildKeyItem("-", _minusKey, Colors.red)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildKeyItem("00", _doubleZero, Colors.grey),
                        buildKeyItem("0", _zeroKey, Colors.black),
                        buildKeyItem(".", _dotKey, Colors.grey),
                        FloatingActionButton(
                          onPressed: ()=> onKeyTapped(_equalsKey),
                          child: Text("=",
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              )
                          ),
                          backgroundColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void resetAction() {
    firstValue.clear();
    _firstNumberController.clear();
    _resultController.clear();
    _actionController.clear();
    reset = false;
    _secondNumberController.clear();
    secondValue.clear();
    secondNumber = false;
  }

  void initState() {
    super.initState();
    _firstNumberController = TextEditingController();
    _resultController = TextEditingController();
    _secondNumberController = TextEditingController();
    _actionController = TextEditingController();
  }
  String convertToString(List values) {
    String val = '';
    for (int i = 0;i < values.length;i++) {
      val+=values[i];
    }
    return val;
  }
  String validateDouble(double doubleValue) {
    int value;
    if (doubleValue % 1 == 0) {
      value = doubleValue.toInt();
    } else {
      return doubleValue.toStringAsFixed(1);
    }
    return value.toString();
  }
  void checkSign(String sign) {
    if (sign == "/") {
      double result = Math.divide(double.parse(convertToString(firstValue)), double.parse(convertToString(secondValue)));
      setValue(result);
    }
    else if (sign == "*") {
      double result =  Math.multiply(double.parse(convertToString(firstValue)), double.parse(convertToString(secondValue)));
      setValue(result);
    }
    else if (sign == "+") {
      double result =  Math.add(double.parse(convertToString(firstValue)), double.parse(convertToString(secondValue)));
      setValue(result);
    }
    else if (sign == "-") {
      double result = Math.subtract(double.parse(convertToString(firstValue)), double.parse(convertToString(secondValue)));
      setValue(result);
    }
  }

  void cleanUpCalculator(String result) {
    firstValue.clear();
    firstValue.add(result);
    secondNumber = false;
    secondValue.clear();
    if (equal == true) {
      _resultController.text = result;
      equal = false;
      reset = true;
    }
    else {
      _firstNumberController.text = result;
      _actionController.clear();
      _secondNumberController.clear();
    }
  }
  void setValue(double result) {
    if (plusMinus == true) {
      result = result*-1;
      String res = validateDouble(result);
      cleanUpCalculator(res);
      plusMinus = false;
    }
    else if (percentage == true) {
      result = result/100;
      String res = validateDouble(result);
      cleanUpCalculator(res);
      percentage = false;
    }
    else {
      String res = validateDouble(result);
      cleanUpCalculator(res);
    }
  }
}