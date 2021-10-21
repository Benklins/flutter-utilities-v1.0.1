abstract class HttpHelper<R> {
  Future<R> get(String url, {dynamic queryParameters, dynamic options});

  Future<R> download(String url, String savePath,
      {dynamic callback, dynamic options});

  Future<R> post(String url, {dynamic body, dynamic options});

  Future<R> put(String url, {dynamic body, dynamic options});

  Future<R> patch(String url, {dynamic body, dynamic options});

  Future<R> delete(String url, {dynamic body, dynamic options});

  Future<Map<String, String>> get headers;
}
