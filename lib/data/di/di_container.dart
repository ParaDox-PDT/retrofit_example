import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_example/data/di/di_container.config.dart';



final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  await getIt.init();
  return getIt.allReady();
}

Future<void> disposeDi() {
  return getIt.reset();
}
