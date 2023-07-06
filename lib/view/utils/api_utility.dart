import 'package:http/http.dart' as http;

class ApiUtility {
  static Map<String, String> getJsonHeaders() {
    return {
      "Content-type": "application/json",
    };
  }
}