import 'package:flutter_driver/driver_extension.dart';
import 'package:testing_app/main.dart' as app;

void main() {
  enableFlutterDriverExtension();
  app.main();
}

// flutter drive --target=test_driver/app.dart --driver=test_driver/details_test.dart