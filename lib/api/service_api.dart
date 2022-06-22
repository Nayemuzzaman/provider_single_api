import 'dart:developer';
import 'dart:io';

import 'package:provider_api/model/data_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<DataModel?> getSinglePostData() async {
  DataModel? result;

  //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/2');
  //http.Response response = await http.get(url);
// when try only if response

  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = DataModel.fromJson(item);
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
