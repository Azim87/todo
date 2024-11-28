// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:todo/configs/di/di_container.dart' as _i387;
import 'package:todo/configs/interceptor/auth_interceptor.dart' as _i1014;
import 'package:todo/configs/interceptor/refresh_token.dart' as _i823;
import 'package:todo/data/data_source/local_data.dart' as _i170;
import 'package:todo/data/repository/login.dart' as _i486;
import 'package:todo/data/repository/signup.dart' as _i684;
import 'package:todo/data/repository/todo.dart' as _i332;
import 'package:todo/service/app_version_service.dart' as _i661;
import 'package:todo/service/todo_api_service.dart' as _i304;
import 'package:todo/ui/pages/authorization/login/login_cubit.dart' as _i668;
import 'package:todo/ui/pages/authorization/signup/signup_cubit.dart' as _i365;
import 'package:todo/ui/pages/todo/create/create_todo_cubit.dart' as _i433;
import 'package:todo/ui/pages/todo/edit/edit_todo_cubit.dart' as _i280;
import 'package:todo/ui/pages/todo/todo_cubit.dart' as _i532;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModule = _$DiModule();
    gh.singleton<_i1014.AuthInterceptor>(() => _i1014.AuthInterceptor());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => diModule.prettyDioLogger);
    gh.lazySingleton<_i361.Dio>(() => diModule.create());
    gh.lazySingleton<_i823.RefreshToken>(() => _i823.RefreshToken());
    gh.lazySingleton<_i661.AppVersionService>(() => _i661.AppVersionService());
    gh.lazySingleton<_i170.LocalData>(() => _i170.LocalData());
    gh.factory<String>(
      () => diModule.devBaseUrl,
      instanceName: 'todo',
      registerFor: {_dev},
    );
    gh.factory<_i361.Dio>(
      () => diModule.setUpForDio(),
      instanceName: 'DioWithLogger',
    );
    gh.factory<String>(
      () => diModule.prodBaseUrl,
      instanceName: 'todo',
      registerFor: {_prod},
    );
    gh.lazySingleton<_i304.TodoApiService>(() => _i304.TodoApiService(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'todo'),
        ));
    gh.lazySingleton<_i332.TodoRepository>(
        () => _i332.TodoRepository(gh<_i304.TodoApiService>()));
    gh.lazySingleton<_i486.LoginRepository>(
        () => _i486.LoginRepository(gh<_i304.TodoApiService>()));
    gh.lazySingleton<_i684.SignupRepository>(
        () => _i684.SignupRepository(gh<_i304.TodoApiService>()));
    gh.factory<_i365.SignUpCubit>(
        () => _i365.SignUpCubit(gh<_i684.SignupRepository>()));
    gh.factory<_i280.EditTodoCubit>(
        () => _i280.EditTodoCubit(gh<_i332.TodoRepository>()));
    gh.factory<_i433.CreateTodoCubit>(
        () => _i433.CreateTodoCubit(gh<_i332.TodoRepository>()));
    gh.factory<_i532.TodoCubit>(
        () => _i532.TodoCubit(gh<_i332.TodoRepository>()));
    gh.singleton<_i668.LoginCubit>(
        () => _i668.LoginCubit(gh<_i486.LoginRepository>()));
    return this;
  }
}

class _$DiModule extends _i387.DiModule {}
