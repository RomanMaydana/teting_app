import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/models/calculator.dart';

void main() {
  group('Calculator', () {
    test('Adds two number', () {
      final calculator = Calculator();
      expect(calculator.add(2, 3), 5);
    });

    test('Substract two numbers', () {
      final calculator = Calculator();
      expect(calculator.subtract(5, 3), 2);
    });

    test('Multiplies two numbers', () {
      final calculator = Calculator();
      expect(calculator.multiply(4, 3), 12);
    });

    test('Divides two numbers', () {
      final calculator = Calculator();
      expect(calculator.divide(6, 3), 2.0);
    });

    test('Throw an error when dividing by zero', () {
      final calculator = Calculator();
      expect(calculator.divide(6, 0), throwsArgumentError);
    });
  });
}
