import 'package:request_utility/request_utility_export.dart';

class HandleRequestResponse<T> {
  HandleRequestResponse._();

  static Future<void> handleResponse<T>(
    Future<SuccessResponse> Function() requestFunc,
    void Function(SuccessResponse<T> response) responseFunc,
    void Function(String error) errorFunc,
  ) async {
    try {
      SuccessResponse<T> response =
          SuccessResponse<T>((await requestFunc()).value);

      responseFunc(response);
    } on RequestFailedException catch (e) {
      var error = (e.message as ErrorResponse);
      errorFunc(error.errorMessage);
    } catch (e) {
      // ignore: avoid_print
      print('GENERAL ERROR CLAUSE ===== $e');
      errorFunc(e.toString());
    }
  }
}
