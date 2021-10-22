import 'package:dio/dio.dart';
import 'package:flutter_utilities/request_utility/request_utility_export.dart';

abstract class DioHttpHelper extends HttpHelper<Response> {
  static late Dio? _client;

  void setMockDio(Dio dio) {
    _client = dio;
  }

  Future<Dio> _getInstance() async {
    _client = _client ?? Dio(dioOption);

    _client!.options.headers = await headers;
    if (interceptiors != null) _client!.interceptors.addAll(interceptiors!);

    return _client!;
  }

  @override
  Future<Response> get(String url,
      {dynamic queryParameters, dynamic options}) async {
    final instance = await _getInstance();

    return instance.get(url,
        queryParameters: queryParameters,
        options: options ?? Options(headers: await headers));
  }

  @override
  Future<Response> getUri(Uri uri, {options}) async {
    final instance = await _getInstance();

    return instance.getUri(uri,
        options: options ?? Options(headers: await headers));
  }

  @override
  Future<Response> download(String url, String savePath,
      {dynamic callback, dynamic options}) async {
    final instance = await _getInstance();
    return instance.download(url, savePath,
        onReceiveProgress: callback, options: Options(headers: await headers));
  }

  @override
  Future<Response> post(String url, {dynamic body, dynamic options}) async {
    final instance = await _getInstance();
    return instance.post(url,
        data: body, options: Options(headers: await headers));
  }

  @override
  Future<Response> put(String url, {dynamic body, dynamic options}) async {
    final instance = await _getInstance();
    return instance.put(url,
        data: body, options: Options(headers: await headers));
  }

  @override
  Future<Response> patch(String url, {dynamic body, dynamic options}) async {
    final instance = await _getInstance();
    return instance.patch(url,
        data: body, options: Options(headers: await headers));
  }

  @override
  Future<Response> delete(String url, {dynamic body, dynamic options}) async {
    final instance = await _getInstance();
    return instance.delete(url, options: Options(headers: await headers));
  }

  @override
  Future<Map<String, String>> get headers;

  List<Interceptor>? get interceptiors;

  BaseOptions? get dioOption => null;
}
