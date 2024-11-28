import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo/core/endpoints.dart';
import 'package:todo/core/utils/constants.dart';
import 'package:todo/data/model/login/login_response.dart';
import 'package:todo/data/model/signup/signup_response.dart';
import 'package:todo/data/model/success/todo_success_response.dart';
import 'package:todo/data/model/todo/todo_response.dart';

part 'todo_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class TodoApiService {
  @factoryMethod
  factory TodoApiService(
    Dio dio, {
    @Named(Constants.API_NAME) final String baseUrl,
  }) = _TodoApiService;

  @POST(Endpoints.SIGNUP)
  Future<SignupResponse> signup({
    @Body() required final Map<String, dynamic> body,
  });

  @POST(Endpoints.LOGIN)
  Future<LoginResponse> login({
    @Body() required final Map<String, dynamic> body,
  });

  @GET(Endpoints.GET_ALL_TODOS)
  @Extra({Constants.APP_VERSION: true})
  Future<TodoResponse> allTodo({
    @Query(TodoQueries.PAGE) required final int page,
    @Query(TodoQueries.PAGE_SIZE) required final int pageSize,
  });

  @POST(Endpoints.ADD_TODO)
  Future<TodoSuccessResponse> addTodo({
    @Body() required final Map<String, dynamic> body,
  });

  @PUT(Endpoints.EDIT_TODO)
  Future<TodoSuccessResponse> editTodo({
    @Path(Paths.ID) required final int id,
    @Body() required final Map<String, dynamic> body,
  });

  @DELETE(Endpoints.DELETE_TODO)
  Future<TodoSuccessResponse> deleteTodo({
    @Path(Paths.ID) required final int id,
  });
}
