import 'package:intl/intl.dart';

class HumansFormat {

 // Usamos static para poder acceder al método sin la necesidad 
 // de crear una instancia de la clase.
  static String humanReadbleNumber(double number){

    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);
  }
}