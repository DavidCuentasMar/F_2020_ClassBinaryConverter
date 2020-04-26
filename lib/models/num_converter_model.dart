import 'package:flutter/material.dart';

class NumConverter with ChangeNotifier {
  String binary;
  String decimal;
  String currentMethod;

  NumConverter({this.binary, this.decimal, this.currentMethod});

  //Note: Require parameters are outise {}
  void changeCurrentMethod() {
    String _x = binary;
    String _y = decimal;
    if (currentMethod == 'Binary -> Decimal') {
      currentMethod = 'Decimal -> Binary';
      convertNumber(int.parse(_x));
    } else {
      currentMethod = 'Binary -> Decimal';
      convertNumber(int.parse(_y));
    }
    notifyListeners();
  }

  void convertNumber(int number) {
    if (currentMethod == 'Binary -> Decimal') {
      binaryToDecimal(number);
    } else {
      decimalToBinary(number);
    }
    notifyListeners();
  }

  void binaryToDecimal(int k) {
    switch (k) {
      case 0:
        binary = binary + "0";
        decimal = int.parse(binary, radix: 2).toRadixString(10);
        break;
      case 1:
        binary = binary + "1";
        decimal = int.parse(binary, radix: 2).toRadixString(10);
        break;
    }
  }

  void decimalToBinary(int k) {
    switch (k) {
      case 0:
        decimal = decimal + "0";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 1:
        decimal = decimal + "1";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 2:
        decimal = decimal + "2";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 3:
        decimal = decimal + "3";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 4:
        decimal = decimal + "4";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 5:
        decimal = decimal + "5";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 6:
        decimal = decimal + "6";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 7:
        decimal = decimal + "7";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 8:
        decimal = decimal + "8";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
      case 9:
        decimal = decimal + "9";
        binary = int.parse(decimal, radix: 10).toRadixString(2);
        break;
    }
  }

  void resetConverter() {
    binary = "";
    decimal = "";
    notifyListeners();
  }
}
