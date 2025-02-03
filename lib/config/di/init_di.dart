import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/di/init_di.config.dart';

@InjectableInit()
GetIt inject(GetIt g, String environment) => g.init(environment: environment);
