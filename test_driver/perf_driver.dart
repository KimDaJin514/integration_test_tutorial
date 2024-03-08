import 'package:integration_test/integration_test_driver.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver;

Future<void> main(){
  return integrationDriver(

    // app_test에서 성능측정하던 traceAction 의 데이터가 여기로 온다
    responseDataCallback: (data) async{
      if(data != null) {
          final timeline = driver.Timeline.fromJson(data['scrolling_timeline']);

          final summary = driver.TimelineSummary.summarize(timeline);

          await summary.writeTimelineToFile(
            'scrolling_timeline',
            pretty: true,
          );
      }
    }
  );
}