import 'package:demo_app/models/num_converter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Converter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final numConverterObj = Provider.of<NumConverter>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              numConverterObj.changeCurrentMethod();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${numConverterObj.currentMethod}',
                //style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerRight,
            child: Text(
              '${numConverterObj.binary}',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  //color: Theme.of(context).accentColor,
                  fontSize: 35),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${numConverterObj.decimal}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  //color: Theme.of(context).accentColor,
                  fontSize: 35),
            ),
          ),
          _buildPadNumber(numConverterObj),
          _buildResetBtn(numConverterObj),
        ],
      ),
    );
  }

  Widget _numberButton(NumConverter numConverterObj, int number) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
            color: Colors.red,
            //color: Theme.of(context).primaryColor,
            onPressed: () {
              numConverterObj.convertNumber(number);
            },
            child: Text(number.toString(),
                style: new TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }

  Widget _buildPadNumber(NumConverter numConverterObj) {
    if (numConverterObj.currentMethod == 'Binary -> Decimal') {
      return Expanded(
        flex: 3,
        child: SizedBox(
          height: double.infinity,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _numberButton(numConverterObj, 1),
                Spacer(),
                _numberButton(numConverterObj, 0),
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
                    _numberButton(numConverterObj, 9),
                    _numberButton(numConverterObj, 8),
                    _numberButton(numConverterObj, 7),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _numberButton(numConverterObj, 6),
                    _numberButton(numConverterObj, 5),
                    _numberButton(numConverterObj, 4),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    _numberButton(numConverterObj, 3),
                    _numberButton(numConverterObj, 2),
                    _numberButton(numConverterObj, 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildResetBtn(NumConverter numConverterObj) {
    if (numConverterObj.currentMethod == 'Binary -> Decimal') {
      return Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Colors.red,
            //color: Theme.of(context).accentColor,
            onPressed: () {
              numConverterObj.resetConverter();
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
                color: Colors.red,
                //color: Theme.of(context).accentColor,
                onPressed: () {
                  numConverterObj.resetConverter();
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
                color: Colors.red,
                //color: Theme.of(context).accentColor,
                onPressed: () {
                  numConverterObj.convertNumber(0);
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
