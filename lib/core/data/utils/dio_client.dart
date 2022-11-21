import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery_app/core/data/utils/logging.dart';

import 'exceptions.dart';

const _defaultConnectTimeOut = Duration.millisecondsPerMinute;
const _defaultReceiveTimeOut = Duration.millisecondsPerMinute;

enum Method { post, get, put, delete, patch }

class DioClient {
  final String baseUrl;
  final List<Interceptor>? interceptors;
  Dio _dio = Dio();

  static header() => {"Content-Type": "application/json; charset=UTF-8"};

  DioClient(this.baseUrl, {Dio? dio, this.interceptors}) {
    if (dio != null) {
      _dio = dio;
    }
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeOut
      ..options.receiveTimeout = _defaultReceiveTimeOut
      ..httpClientAdapter
      ..options.headers = header();

    if (kDebugMode) {
      _dio.interceptors.add(_logInterceptor());
    }
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    _dio.interceptors.add(_authInterceptor());
  }

  Future<Response> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;
    try {
      switch (method) {
        case Method.post:
          response = await _dio.post(url, data: params);
          break;
        case Method.get:
          response = await _dio.get(url, queryParameters: params);
          break;
        case Method.put:
          response = await _dio.put(url, data: params);
          break;
        case Method.delete:
          response = await _dio.delete(url, queryParameters: params);
          break;
        case Method.patch:
          response = await _dio.patch(url);
          break;
      }

      var statusCode = response.statusCode;

      if (statusCode == 200) {
        return response;
      }  else if (statusCode == 400) {
        throw BadRequestException();
      } else if (statusCode == 401) {
        throw AuthException();
      } else if (statusCode == 403) {
         throw ForbiddenException();
      } else if (statusCode != null && statusCode >= 500) {
        throw ServerErrorException();
      } else {
        throw UnknownException();
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw NoNetworkException();
    } on FormatException catch (e) {
      logger.e(e);
      throw BadFormatException();
    } on DioError catch (e) {
      logger.e(e);
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw UnknownException();
    }
  }

  InterceptorsWrapper _logInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      logger.i("REQUEST[${options.method}] => PATH: ${options.path}"
          "=> REQUEST VALUES: ${options.queryParameters} => HEADERS: ${options.headers}");
      return handler.next(options);
    }, onError: (e, handler) {
      logger.i("Error[${e.response?.statusCode}");
      return handler.next(e);
    }, onResponse: (response, handler) {
      logger
          .i("RESPONSE => STATUS: ${response.statusCode}, RESPONSE: $response");
      return handler.next(response);
    });
  }

  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.putIfAbsent(
            "Authorization",
            () =>
                "Client-ID YOUR_API_ACCESS_KEY_HERE");
        return handler.next(options);
      },
    );
  }
}
