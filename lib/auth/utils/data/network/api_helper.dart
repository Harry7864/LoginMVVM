import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'api_exception.dart';

class ApiHelper {
  /// Request Ends :: can do encode / decode or any other setup required for an API globally
  Future<dynamic> get(BuildContext context, String url,
      {bool isAccessRequired = true, bool isDeviceUrl = false}) async {
    dynamic responseJson;
    http.Response response;
    String finalUrl = ApiConstants.baseURL + url;
    if (isDeviceUrl) {
      finalUrl = finalUrl.replaceAll('admin', 'device');
    }
    try {
      Map<String, String> headers = await getHeaders(isAccessRequired,
          isDeviceUrl: isDeviceUrl, iApiKeyNeeded: isDeviceUrl);
      response = await http.get(Uri.parse(finalUrl), headers: headers);
      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print('ApiHelper ===> Exception :: $e');
    }
    return responseJson;
  }

  Future<dynamic> post(BuildContext context, String url, dynamic body,
      {bool isAccessRequired = true}) async {
    dynamic responseJson;
    dynamic response;

    if (body != null) print('Body :: $body');
    try {
      Map<String, String> headers = await getHeaders(isAccessRequired);

      response = await http.post(Uri.parse(ApiConstants.baseURL + url),
          body: body, headers: headers);

      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<Map<String, String>> getHeaders(bool isAccessRequired,
      {bool iApiKeyNeeded = false, bool isDeviceUrl = false}) async {
    String token = '';
    if (isAccessRequired) {
      /// Get authentication token
      token = '';
    }
    var headers = {
      "Content-Type": "application/json",
    };
    if (isAccessRequired) {
      headers = {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      };
    }
    if (iApiKeyNeeded) {
      /// Change *api_key* based on requirement
      headers.addAll({'api_key': ApiConstants.apiKey});
    }
    print(headers);
    return headers;
  }

  /// Response handling globally for all the APIs
  dynamic _returnResponse(BuildContext context, http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
