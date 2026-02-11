import 'package:http/http.dart' as http;

enum RequestType { GET, POST, DELETE }

class BaseService {
  Future<http.Response> response(RequestType requestType, String url,
      {dynamic body}) async {
    http.Response response;
    Uri uri = Uri.parse(url);
    Map<String, String> headers = {"Content-Type": "application/json"};

    switch (requestType) {
      case RequestType.GET:
        response = await http.get(uri, headers: headers);
        break;
      case RequestType.POST:
        response = await http.post(uri, body: body, headers: headers);
        break;
      case RequestType.DELETE:
        response = await http.delete(uri, headers: headers);
        break;
    }

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('Error');
    }
    return response;
  }
}
