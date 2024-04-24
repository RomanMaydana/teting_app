import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeLine = driver.Timeline.fromJson(
            data['scrolling_summary'] as Map<String, dynamic>);

        final summary = driver.TimelineSummary.summarize(timeLine);

        await summary.writeTimelineToFile('scrolling_summary',
            pretty: true, includeSummary: true);
      }
    },
  );
}

// flutter drive \
  // --driver=test_driver/perf_driver.dart \
  // --target=integration_test/perf_test.dart \
  // --profile \
  // --no-dds