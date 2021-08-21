import 'package:flutter_utilities/utilities.dart';

class HandleRequestResponse<T> {
  HandleRequestResponse._();

  static Future<void> handleResponse<T>(
    Future<SuccessResponse> Function() requestFunc,
    void responseFunc(SuccessResponse<T> response),
    void errorFunc(String error),
  ) async {
    try {
      SuccessResponse<T> response =
          SuccessResponse<T>((await requestFunc()).value);
          
      responseFunc(response);
    } on RequestFailedException catch (e) {
      var error = (e.message as ErrorResponse);
      errorFunc(error.errorMessage);
    } catch (e) {
      print('GENERAL ERROR CLAUSE ===== $e');
      errorFunc(e.toString());
    }
  }
}
