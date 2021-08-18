abstract class HttpHelper<R> {
  Future<R> get(String url, {dynamic options});

  Future<R> download(String url, String savePath, {dynamic callback});

  Future<R> post(String url, {dynamic body});

  Future<R> put(String url, {dynamic body});

  Future<R> patch(String url, {dynamic body});

  Future<R> delete(String url, {dynamic body});
  
  Future<Map<String, String>> get headers;
  
}
