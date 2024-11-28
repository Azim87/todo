abstract class Endpoints {
  static const String BASE_URL = String.fromEnvironment('baseUrl');
  static const String REFRESH = 'refresh';
  static const String SIGNUP = 'signup';
  static const String LOGIN = 'login';
  static const String GET_ALL_TODOS = 'auth/todo/all';
  static const String ADD_TODO = 'auth/todo/addTodo';
  static const String EDIT_TODO = 'auth/todo/todo{id}';
  static const String DELETE_TODO = 'auth/todo/delete{id}';
}
