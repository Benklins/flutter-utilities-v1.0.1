class RequestFailedException<D> implements Exception {
  final D message;

  RequestFailedException(this.message);
}
