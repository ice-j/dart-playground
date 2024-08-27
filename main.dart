import 'bin/get_it.dart' as injectable;
import 'bin/kiwi.dart' as kiwi;

Future<void> main(List<String> arguments) async {
  if(arguments.isEmpty) {
    print('You must specify which DI implementation to run\n'
          'Available options:\n'
          '"kiwi": "dart run main.dart kiwi"\n'
          '"injectable": "dart run main.dart injectable"');
    return;
  }
  
  var diImplementationToRun = arguments[0].toLowerCase();

  if(diImplementationToRun != 'injectable' && diImplementationToRun != 'kiwi') {
    print('Invalid implementation chosen\n'
          'Available options are "kiwi" and "injectable"');
    return;
  }
  
  if(diImplementationToRun == 'kiwi') {
    await kiwi.main();
  } else {
    await injectable.main();
  }
}