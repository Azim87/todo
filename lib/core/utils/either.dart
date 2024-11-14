class Result<E, S> {
  final E? error;
  final S? success;

  Result._({this.error, this.success});

  factory Result.error(E error) {
    return Result._(error: error);
  }

  factory Result.success(S success) {
    return Result._(success: success);
  }

  bool get isSuccess => success != null;

  bool get isError => error != null;
}
