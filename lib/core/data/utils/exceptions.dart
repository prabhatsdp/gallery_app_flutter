abstract class IAppException implements Exception {
  final String message = "Unknown error";
}

class BadRequestException implements IAppException {
  @override
  final String message;

  BadRequestException({this.message = "Bad request error!"});

  @override
  String toString() {
    return "BadRequestException: $message";
  }
}

class ServerErrorException implements IAppException {
  @override
  final String message;

  ServerErrorException({this.message = "Server error!"});

  @override
  String toString() {
    return "ServerErrorException: $message";
  }
}

class AuthException implements IAppException {
  @override
  final String message;

  AuthException([this.message = "Unauthorized"]);

  @override
  String toString() {
    return "AuthException: $message";
  }
}

class ForbiddenException implements IAppException {
  @override
  final String message;

  ForbiddenException({this.message = "Forbidden request!"});

  @override
  String toString() {
    return "ForbiddenException: $message";
  }
}

class UnknownException implements IAppException {
  @override
  final String message;

  UnknownException({this.message = "Unknown error!"});

  @override
  String toString() {
    return "UnknownException: $message";
  }
}

class NoNetworkException implements IAppException {
  @override
  final String message;

  NoNetworkException({this.message = "No network error"});

  @override
  String toString() {
    return "NoNetworkException: $message";
  }
}

class BadFormatException implements IAppException {
  @override
  final String message;

  BadFormatException({this.message = "Bad response format!"});

  @override
  String toString() {
    return "BadFormatException: $message";
  }
}
