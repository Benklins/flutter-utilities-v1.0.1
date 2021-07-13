///This is a based class to simplify api's consumption
///[D] this is the incoming request response data type for instance
///if the request is using Dio, [D] will the the [Response] of the dio call
///[R] this represent the result of the api request
///[E] this represent the error data type if there was an error
abstract class SimplifyApiConsumingBase<D, R, E> {
  Future<R> simplifyApiRequest(Future<D> Function() requestFunction,
      {bool useStatusCodeForSuccessCheck = true,
      required R Function(dynamic data) successResponse,
      E Function(D errorData) errorResponse,
      int statusCodeSuccess = 200});

  E parseErrorFromResponse(D requestResponse);
}
