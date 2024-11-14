import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo/data/model/success/todo_success_response.dart';

import '../data/model/login/login_response.dart';
import '../data/model/signup/signup_response.dart';
import '../data/model/todo/todo_response.dart';

part 'todo_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class TodoApiService {
  @factoryMethod
  factory TodoApiService(Dio dio, {@Named('todo') final String baseUrl}) = _TodoApiService;

  @POST('signup')
  Future<SignupResponse> signup({
    @Body() required Map<String, dynamic> body,
  });

  @POST('login')
  Future<LoginResponse> login({
    @Body() required Map<String, dynamic> body,
  });

  @GET('auth/todo/all')
  Future<TodoResponse> allTodo();

  @POST('auth/todo/addTodo')
  Future<TodoSuccessResponse> addTodo({
    @Body() required Map<String, dynamic> body,
  });

  @PUT('auth/todo/todo{id}')
  Future<TodoSuccessResponse> editTodo({
    @Path('id') required final int id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('auth/todo/delete{id}')
  Future<TodoSuccessResponse> deleteTodo({
    @Path('id') required final int id,
  });
}
