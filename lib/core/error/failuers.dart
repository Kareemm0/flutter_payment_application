abstract class Failure {
  final String errmessage;

  Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);
}
