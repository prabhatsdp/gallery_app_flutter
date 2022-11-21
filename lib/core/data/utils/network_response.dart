abstract class ApiResponse<S, E> {}

class ApiResponseFailed<S, E> extends ApiResponse<S, E> {
  final E? errorBody;
  final Exception error;

  ApiResponseFailed({
    this.errorBody,
    required this.error,
  });
}

class ApiResponseSuccess<S, E> extends ApiResponse<E, S> {
  final S data;

  ApiResponseSuccess({
    required this.data,
  });
}
