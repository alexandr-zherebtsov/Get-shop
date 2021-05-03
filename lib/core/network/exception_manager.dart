class UnauthorizedException implements Exception {
  String msg;

  UnauthorizedException(this.msg);
}

class ForbiddenException implements Exception {
  String msg;

  ForbiddenException(this.msg);
}

class NotFoundException implements Exception {
  String msg;

  NotFoundException(this.msg);
}

class InternalServerErrorException implements Exception {
  String msg;

  InternalServerErrorException(this.msg);
}

class BadRequestException implements Exception {
  String msg;

  BadRequestException(this.msg);
}

/// Exception that throws when API call is longer than [timeout]
class ConnectionTimeoutException implements Exception {
  String? msg;

  /// Constructor, [msg] is optional
  ConnectionTimeoutException({this.msg});
}

class PaymentRequiredException implements Exception {
  String msg;

  PaymentRequiredException(this.msg);
}

class TooManyRequestsException implements Exception {
  String msg;

  TooManyRequestsException(this.msg);
}

final exceptions = {
  400: (String msg) => BadRequestException(msg),
  401: (String msg) => UnauthorizedException(msg),
  402: (String msg) => PaymentRequiredException(msg),
  403: (String msg) => ForbiddenException(msg),
  404: (String msg) => NotFoundException(msg),
  429: (String msg) => TooManyRequestsException(msg),
  500: (String msg) => InternalServerErrorException(msg),
};

/// Exception that throws when API call is failed
class FetchingDataException implements Exception {
  String? msg;

  /// Constructor, [msg] is optional
  FetchingDataException({this.msg});
}
