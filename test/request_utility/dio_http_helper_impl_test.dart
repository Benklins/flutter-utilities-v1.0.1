import 'package:dio/dio.dart';
import 'package:dio/src/interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utilities/request_utility/request_utility_export.dart';
import 'package:mocktail/mocktail.dart';

class TestDioHttpHelperImpl extends DioHttpHelper {
  @override
  Future<Map<String, String>> get headers async =>
      {'Authorization': 'BlaBlaBla'};

  @override
  List<Interceptor>? get interceptiors => null;
}

class MockDio extends Mock implements Dio {}

main() {
  late TestDioHttpHelperImpl dioHttpHelperImpl;
  late MockDio dio;
  setUp(
    () {
      dio = MockDio();
      when(() => dio.options).thenReturn(BaseOptions());
      dioHttpHelperImpl = TestDioHttpHelperImpl();
      dioHttpHelperImpl.setMockDio(dio);
    },
  );
}

String get _dummyUrl => 'https://dummy.com';

void _setUpDioMockCall(MockDio dio) {
  when(() => dio.get(any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
          cancelToken: any(named: 'cancelToken')))
      .thenAnswer((invocation) => Future.value(
            Response(
              requestOptions: RequestOptions(path: 'path'),
            ),
          ));
}
