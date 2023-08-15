


class AppExceptions implements Exception{

  final String message;
  final String prefix;

  AppExceptions(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix  $message';
  }
}


class UnAuthorizedException extends AppExceptions{
  UnAuthorizedException ([String? message]):super(message!,'UnAuthorized Request..!');
}
class ApiNotRespondingException extends AppExceptions{
  ApiNotRespondingException([String? message]):super(message!,'Api Not Respond In Time..!');
}
class BadRequestException extends AppExceptions{
  BadRequestException([String? message,String? url]):super(message!,'Bad Request..!' );
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]):super(message!,'Unable To Process');
}
