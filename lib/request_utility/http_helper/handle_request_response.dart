import 'package:flutter_utilities/utilities.dart';

class HandleRequestResponse{
  HandleRequestResponse._();
  
  static Future<void> handleResponse(
     Future<SuccessResponse> Function() requestFunc,
    Function responseFunc(SuccessResponse response),
    Function errorFunc(String error),
  ) async{
    try{
        SuccessResponse response = await requestFunc();
      responseFunc(response);
    }on RequestFailedException catch(e){
      var error = (e.message as ErrorResponse);
      errorFunc(error.errorMessage);
    }
  }
}
