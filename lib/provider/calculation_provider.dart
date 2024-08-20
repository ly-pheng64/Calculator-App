import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_tree/function_tree.dart';

final calculationProvider =
    ChangeNotifierProvider<calculationNotifier>((_) => calculationNotifier());

class calculationNotifier extends ChangeNotifier {
  List<String> datalist = ['0'];
  String predata = ' ';

  bool isSign = false;
  bool isResult = false;

  String get data => datalist.join(' ');
  String get equation => data
      .replaceAll('\u00f7', '/') // Replace division symbol with '/'
      .replaceAll('\u00d7', '*') // Replace multiplication symbol with '*'
      .replaceAll('\u2212', '-'); // Replace minus sign with '-'

  void addNumber(String number) {
    if (isResult || (datalist.length == 1 && datalist.last == '0')) {
      datalist = [number];
      isResult = false;
    } else if (isSign) {
      datalist.add(number);
      isSign = false;
    } else if (datalist.last.startsWith('(')) {
      final temp = datalist.last.substring(0, datalist.last.length - 1);
      datalist.last = ('$temp$number');
    } else {
      datalist.last += number;
    }
    notifyListeners();
  }

  void _negation() {
    if (isSign) {
      return;
    }
    if (datalist.last.startsWith('(')) {
      datalist.last = datalist.last.substring(2, datalist.last.length - 1);
    } else if (datalist.last.startsWith('-')) {
      datalist.last = '(${datalist.last})';
    } else {
      datalist.last = '(-${datalist.last})';
    }
  }

  void _percentage() {
    if (isSign) {
      return;
    }
    final resual = datalist.last.interpret() * 0.01;
    datalist.last = resual < 0 ? '($resual)' : resual.toString();
  }

  void _decimalpoint() {
    if (datalist.last.contains('.')) {
      return;
    }
    if (isSign) {
      datalist.add('0');
      isSign = false;
    }

    if (datalist.last.startsWith('(')) {
      final temp = datalist.last.substring(0, datalist.last.length - 1);
      datalist.last = '$temp.)';
    } else {
      datalist.last += '.';
    }
  }

  void _clear() {
    datalist = ['0'];
    predata = ' ';
    isSign = false;
    notifyListeners();
  }

  void _showResult() {
    predata = data;
    final result = equation.interpret();
    datalist = [
      result % 1 == 0 ? result.toInt().toString() : result.toString(),
    ];
    isResult = true;
    notifyListeners();
  }

  void addSign(String sign) {
    isResult = false;

    switch (sign) {
      case '+/\u2212':
        _negation();
        break;
      case '%':
        _percentage();
        break;
      case '.':
        _decimalpoint();
        break;
      case 'c':
        _clear();
        break;
      case '=':
        _showResult();
        break;

      default:
        if (isSign) {
          datalist.last = sign;
        } else {
          datalist.add(sign);
          isSign = true;
        }
        break;
    }
    notifyListeners();
  }
}
