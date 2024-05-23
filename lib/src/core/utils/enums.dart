enum EnumInternet {
  unavailable(-1),
  unknown(0),
  mobile(1),
  wifi(2),
  ethernet(3);

  const EnumInternet(this.value);
  final int value;

  factory EnumInternet.convertToEnum(int v) =>
      values.firstWhere((x) => x.value == v, orElse: () => unavailable);
}

enum Example {
  invalidEmail('Invalid email'),
  emailAlreadyInUse('Email already in use'),
  weakPassword('Password is too weak'),
  wrongPassword('Wrong password');

  const Example(this.message);
  final String message;
}

enum StatusCode {
  badRequest(401, 'Bad request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not found'),
  internalServerError(500, 'Internal server error'),
  notImplemented(501, 'Not implemented');

  const StatusCode(this.code, this.description);
  final int code;
  final String description;

  factory StatusCode.convertToEnum(int v) =>
      values.firstWhere((x) => x.code == v, orElse: () => notFound);

  @override
  String toString() => 'StatusCode($code, $description)';
}
