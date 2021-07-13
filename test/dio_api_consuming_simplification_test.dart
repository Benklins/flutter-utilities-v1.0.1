import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utilities/request_utility/dio_api_consuming_simplification.dart';
import 'package:utilities/request_utility/error/error.dart';
import 'package:utilities/request_utility/success/success.dart';

class MockResponse extends Mock implements Response {}

main() {
  late MockResponse mockResponse;
  late DioApiConsumption dioApiConsuming;
  setUp(
    () {
      dioApiConsuming = DioApiConsumption.factory();
      mockResponse = MockResponse();
    },
  );

  group(
    'Test api request where success is measured by status code',
    () {
      test(
        'Returns success response when useStatusCode is true and request was '
        'successful',
        () async {
          when(() => mockResponse.statusCode).thenReturn(200);

          var simplifyApiRequest = await dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(simplifyApiRequest, SuccessResponse('Success'));
        },
      );

      test(
        'Ensure request throws [RequestFailedException] when useStatusCode is '
        'true but request status does not equal success status code',
        () async {
          when(() => mockResponse.statusCode).thenReturn(400);

          var simplifyApiRequest = dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(
            () async => await simplifyApiRequest,
            throwsA(isA<RequestFailedException<ErrorResponse>>()),
          );
        },
      );
    },
  );

  group(
    'Test api request where success is measured by the data success field',
    () {
      test(
        'Returns success response when useStatusCode is false and request was '
        'successful',
        () async {
          when(() => mockResponse.statusCode).thenReturn(201);
          when(() => mockResponse.data).thenReturn({'status': 'success'});

          var simplifyApiRequest = await dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              useStatusCodeForSuccessCheck: false,
              dataSuccessValidator: (data) => data['status'] == 'success',
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(simplifyApiRequest, SuccessResponse('Success'));
        },
      );

      test(
        'Throws assertion error when useStatusCodeForRequestSuccess is false '
        'and dataSuccessValidator is null',
        () async {
          when(() => mockResponse.statusCode).thenReturn(201);
          when(() => mockResponse.data).thenReturn({'status': 'success'});

          var simplifyApiRequest = dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              useStatusCodeForSuccessCheck: false,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(() async => await simplifyApiRequest, throwsAssertionError);
        },
      );

      test(
        'Ensure request throws [RequestFailedException] when useStatusCode is '
        'false and data shows request failed',
        () async {
          when(() => mockResponse.statusCode).thenReturn(201);
          when(() => mockResponse.data).thenReturn({'status': 'failed'});

          var simplifyApiRequest = dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(
            () async => await simplifyApiRequest,
            throwsA(isA<RequestFailedException<ErrorResponse>>()),
          );
        },
      );
    },
  );

  group(
    'Test api request exception is thrown',
    () {
      test(
        'Ensure when a SocketException is thrown during making request,'
        'ensure it is handled and a [RequestFailedException] is thrown',
        () async {
          when(() => mockResponse.statusCode).thenReturn(200);
          when(() => mockResponse.data).thenThrow(SocketException('message'));

          var simplifyApiRequest = dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(
            () async => await simplifyApiRequest,
            throwsA(isA<RequestFailedException<ErrorResponse>>()),
          );
        },
      );

      test(
        'Ensure when a DioError exception is thrown during making request,'
        'ensure it is handled and a [RequestFailedException] is thrown',
        () async {
          when(() => mockResponse.statusCode).thenReturn(200);
          when(() => mockResponse.data).thenThrow(
            DioError(
              requestOptions: RequestOptions(path: ''),
            ),
          );

          var simplifyApiRequest = dioApiConsuming.simplifyApiRequest(
              () => Future.value(mockResponse),
              statusCodeSuccess: 200,
              successResponse: (data) => SuccessResponse<String>('Success'));

          expect(
            () async => await simplifyApiRequest,
            throwsA(isA<RequestFailedException<ErrorResponse>>()),
          );
        },
      );
    },
  );
}
