import 'package:dio/dio.dart';

import '../../utilities.dart';

abstract class DioHttpHelper extends HttpHelper<Response> {
  static late Dio _client;

  Future<Dio> _getInstance() async {
    _client = Dio();

    _client.options.headers = await headers;
    if (interceptiors != null) _client.interceptors.addAll(interceptiors!);

    return _client;
  }

  Future<Response> get(String url, {dynamic options}) async {
    final instance = await _getInstance();

    return instance.get(url,
        options: options ?? Options(headers: await headers));
  }

  Future<Response> download(String url, String savePath,
      {dynamic callback}) async {
    final instance = await _getInstance();
    return instance.download(url, savePath,
        onReceiveProgress: callback, options: Options(headers: await headers));
  }

  Future<Response> post(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.post(url,
        data: body, options: Options(headers: await headers));
  }

  Future<Response> put(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.put(url,
        data: body, options: Options(headers: await headers));
  }

  Future<Response> patch(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.patch(url,
        data: body, options: Options(headers: await headers));
  }

  Future<Response> delete(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.delete(url, options: Options(headers: await headers));
  }

  @override
  Future<Map<String, String>> get headers;

  List<Interceptor>? get interceptiors;
}
