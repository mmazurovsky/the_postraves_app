import 'package:logging/logging.dart';

late Logger myGlobalLogger;

setupLogger() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    //todo
    // print('${record.level.name}: ${record.time}: ${record.message}');
  });
  myGlobalLogger = Logger('PostravesMobileLogger');
}
