abstract class Result<T> {}

class Failed<T> extends Result<T> {
  final String errorMessage;

  Failed(this.errorMessage);
}

class Success<T> extends Result<T> {
  final T data;

  Success({required this.data});
}
