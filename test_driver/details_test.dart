import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('Navigation Test', (){
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null){
        await driver!.close();
      }
    });
    test('navigate from home to detail screen', () async {
      await driver!.tap(find.text('Go to Detail Screen'));
      expect(await driver!.getText(find.text('This is the detail screen')), 'This is the detail screen');
    });
  });
}