import 'dart:convert';
import 'dart:io';

import 'package:electo/app/services/failure.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RestApi {
  static var client = new http.Client();

  static Future getData({dynamic query, Map<String, String>? headers}) async {
    try {
      http.Response result = await client.get(
          Uri.parse(
            base + query,
          ),
          headers: headers);
      if (result.statusCode == 200) {
        return result.body;
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message.toString();
      }
      print(e.toString());
      return e.toString();
    }
  }

  static sendData(
      {dynamic query, Map<String, String>? headers, dynamic body}) async {
    try {
      print(Uri.parse(base + query));
      http.Response result = await http.post(Uri.parse(base + query),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      if (result.statusCode == 200) {
        return jsonDecode(result.body);
      } else if (result.statusCode.toString().contains('4')) {
        var res = jsonDecode(result.body);
        var test = res['error'];
        throw Failure(test['message'].toString());
      }
    } on SocketException {
      print('offline');
      throw Failure("You are offline at the moment");
    } catch (e) {
      if (e is HttpException) {
        return Failure(e.message.toString());
      }
      if (e is PlatformException) {
        return Failure(e.message.toString());
      }
      throw Failure(e.toString());
    }
  }

  static const base = "http://localhost:3000";
}
