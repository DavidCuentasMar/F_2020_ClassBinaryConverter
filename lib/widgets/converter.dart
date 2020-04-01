import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = "";
  String _currentMethod = "Binary -> Decimal";
  String _decimal =
      "0"; // _decimal = int.parse(_binary, radix: 2).toRadixString(10);

  void _onPressed(int k) {
    setState(() {
      if (_currentMethod == 'Binary -> Decimal') {
        switch (k) {
          case 0:
            _binary = _binary + "0";
            _decimal = int.parse(_binary, radix: 2).toRadixString(10);
            break;
          case 1:
            _binary = _binary + "1";
            _decimal = int.parse(_binary, radix: 2).toRadixString(10);
            break;
        }
      } else {
        switch (k) {
          case 0:
            _decimal = _decimal + "0";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 1:
            _decimal = _decimal + "1";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 2:
            _decimal = _decimal + "2";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 3:
            _decimal = _decimal + "3";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 4:
            _decimal = _decimal + "4";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 5:
            _decimal = _decimal + "5";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 6:
            _decimal = _decimal + "6";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 7:
            _decimal = _decimal + "7";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 8:
            _decimal = _decimal + "8";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
          case 9:
            _decimal = _decimal + "9";
            _binary = int.parse(_decimal, radix: 10).toRadixString(2);
            break;
        }
      }
    });
  }

  void _reset() {
    setState(() {
      _binary = "";
      _decimal = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                if (_currentMethod == 'Binary -> Decimal') {
                  _currentMethod = 'Decimal -> Binary';
                } else {
                  _currentMethod = 'Binary -> Decimal';
                }
              });
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_currentMethod',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerRight,
            child: Text(
              '$_binary',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 35),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_decimal',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  fontSize: 35),
            ),
          ),
          _buildPadNumber(_currentMethod),
          _buildResetBtn(),
        ],
      ),
    );
  }

  Widget _numberButton(int number) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              _onPressed(number);
            },
            child: Text(number.toString(),
                style: new TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }

  Widget _buildPadNumber(String currentMethod) {
    if (currentMethod == 'Binary -> Decimal') {
      return Expanded(
        flex: 3,
        child: SizedBox(
          height: double.infinity,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _numberButton(1),
                Spacer(),
                _numberButton(0),
              ]),
        ),
      );
    } else {
      return Expanded(
        flex: 3,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _numberButton(9),
                    _numberButton(8),
                    _numberButton(7),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _numberButton(6),
                    _numberButton(5),
                    _numberButton(4),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _numberButton(3),
                    _numberButton(2),
                    _numberButton(1),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildResetBtn() {
    if (_currentMethod == 'Binary -> Decimal') {
      return Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              _reset();
            },
            child: Text(
              "Reset",
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  _reset();
                },
                child: Text(
                  "Reset",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  _onPressed(0);
                },
                child: Text(
                  "0",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
