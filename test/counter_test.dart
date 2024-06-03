import 'package:flutter_test/flutter_test.dart';


void main(){
  test('Counter increments smoke test', () {
    int counter = 0;
    counter++;
    expect(counter, 1);
  });
}