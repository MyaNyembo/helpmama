// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;



class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}


class TransferProtocol {
  final String url;
  final MethodProtocol method;
  final Map<String, dynamic> data;
  final String? message;

  const TransferProtocol( this.url,{
    this.data = const <String,dynamic>{},
    this.message,
    this.method = MethodProtocol.GET,
  });

  Uri get _uri => Uri.parse(url);

  Future<List<Map<String, dynamic>>> get() async {
    final response = await http.get(_uri);
    List<Map<String, dynamic>> dataList = [];
    if (response.statusCode == 200) {
      var value = jsonDecode(response.body) as Map;
      for (var element in value['data']){
        dataList.add(Map.from(element));
      }
      debugPrint("get() => response.statusCode : ${response.statusCode} \n ");
      return dataList;
    } else {
      throw Exception('Failed to load');
    }
  }

}


enum MethodProtocol {
  /// Most commonly "GET" or "POST", less commonly "HEAD", "PUT", or "DELETE".
  GET,
  POST,
  HEAD,
  PUT,
  DELETE
}

extension MethodHelper on MethodProtocol {
  String get name {
    switch (this) {
      case MethodProtocol.GET:
        return 'GET';
      case MethodProtocol.POST:
        return 'POST';
      case MethodProtocol.HEAD:
        return 'HEAD';
      case MethodProtocol.PUT:
        return 'PUT';
      case MethodProtocol.DELETE:
        return 'DELETE';
    }
  }
}
