enum NetworkMethod { get, post, put, delete }

class NetworkRequest {
  String path;
  NetworkMethod method;
  Map<String, dynamic>? body;
  Map<String, dynamic> headers;

  NetworkRequest({
    required this.path,
    required this.method,
    this.body,
    this.headers = const {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
  });
}
