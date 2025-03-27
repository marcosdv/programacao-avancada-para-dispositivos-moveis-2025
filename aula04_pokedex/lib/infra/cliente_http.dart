import 'dart:convert';

import 'package:http/http.dart' as http;

class ClienteHttp {

  Future<List<dynamic>> getJson(String link, {String tagJson = ''}) async {
    var url = Uri.parse(link);
    var response = await http.get(url);

    var dados = json.decode(response.body);
    return tagJson.isEmpty ? dados : dados[tagJson];
  }

}