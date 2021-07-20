import 'package:dio/dio.dart';

import '../../utilities.dart';

class DioHttpHelper extends HttpHelper<Response> {
  static late Dio _client;

  Future<Dio> _getInstance() async {
    final storageToken = authorizationToken;

    _client = Dio();

    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    if (storageToken != null) headers['Authorization'] = 'Token $storageToken';

    _client.options.headers = headers;

    return _client;
  }

  Future<Response> get(String url, {dynamic options}) async {
    final instance = await _getInstance();

    return instance.get(url, options: options);
  }

  Future<Response> download(String url, String savePath,
      {dynamic callback}) async {
    final instance = await _getInstance();
    return instance.download(url, savePath, onReceiveProgress: callback);
  }

  Future<Response> post(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.post(url, data: body);
  }

  Future<Response> put(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.put(url, data: body);
  }

  Future<Response> patch(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.patch(url, data: body);
  }

  Future<Response> delete(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.delete(url);
  }

  @override
  String get authorizationToken => 'token';
}
