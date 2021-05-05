import 'dart:convert';

 class JsonParser {
   static dynamic toJson(dynamic data) {
    return jsonEncode(data);
  }
}
