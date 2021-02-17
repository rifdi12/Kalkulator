import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class Kalkulator with ChangeNotifier {
  String _hasil;
  String _input;
  List<int> _hasilBilanganPrima = List<int>();

  String get input => _input;
  String get hasil => _hasil;
  List<int> get hasilPrima => _hasilBilanganPrima;

  set hasilPrima(value) {
    _hasilBilanganPrima = value;
    notifyListeners();
  }

  bool checkingBilanganPrima(hasil) {
    int r = 0;
    if (num.parse(hasil) >= 1) {
      for (int i = 1; i <= num.parse(hasil); i++) {
        int i2 = num.parse(hasil) % i;
        if (i2 == 0) {
          r++;
        }
      }
      if (r == 2) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  set hasil(value) {
    List<int> _hasilBilanganPrimas = _hasilBilanganPrima;
    //Replace String agar bisa di lakukan Perhitungan
    value = value.replaceAll(' ', '');
    value = value.replaceAll('x', '*');
    value = value.replaceAll('÷', '/');

    //Parse String ke matematika
    Parser p = new Parser();
    Expression exp = p.parse("$value");
    String result = exp.evaluate(EvaluationType.REAL, null).toString();

    //Jika Value terakhir .0 maka .0 akan di hapus example 100.0 => 100
    String checkLastString = result.substring(result.length - 2);
    if (checkLastString == '.0') {
      result = result.replaceAll('.0', '');
    } else {
      result = result;
    }
    bool isPrimes = checkingBilanganPrima(result);
    if (isPrimes) {
      _hasilBilanganPrimas.add(int.parse(result));
      hasilPrima = _hasilBilanganPrimas;
      // print(hasilPrima);
    }
    _hasil = result;
    notifyListeners();
  }

  set input(String value) {
    _input = value;
    notifyListeners();
  }
}
