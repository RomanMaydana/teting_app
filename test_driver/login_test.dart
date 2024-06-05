import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login App', () {
    FlutterDriver? driver;
    setUp(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Succeful login', () async {
      await driver!.tap(find.byValueKey('emailField'));
      await driver!.enterText('user@example.com');

      await driver!.tap(find.byValueKey('passwordField'));
      await driver!.enterText('password');

      await driver!.tap(find.byValueKey('loginButton'));

      await driver!.waitFor(find.byValueKey('Buy milk'));
      expect(await driver!.getText(find.byValueKey('Buy milk')), 'Buy milk');
    });
  });
}
