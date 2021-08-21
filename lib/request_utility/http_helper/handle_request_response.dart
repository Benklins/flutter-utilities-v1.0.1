import 'package:flutter_utilities/utilities.dart';

class HandleRequestResponse<T> {
  HandleRequestResponse._();

  static Future<void> handleResponse<T>(
    Future<SuccessResponse<T>> Function() requestFunc,
    void responseFunc(SuccessResponse response),
    void errorFunc(String error),
  ) async {
    try {
      SuccessResponse<T> response = await requestFunc();
      responseFunc(response);
    } on RequestFailedException catch (e) {
      var error = (e.message as ErrorResponse);
      errorFunc(error.errorMessage);
    }
  }
}
