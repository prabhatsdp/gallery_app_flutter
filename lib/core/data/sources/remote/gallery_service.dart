import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery_app/core/data/utils/exceptions.dart';
import 'package:gallery_app/core/data/utils/logging.dart';
import 'package:gallery_app/core/data/utils/network_response.dart';
import 'package:logger/logger.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "https://api.unsplash.com";

class GalleryService {
  Dio? _dio;
  static header() => {"Content-Type": "application/json"};

  Future<GalleryService> init() async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    if(kDebugMode) {
      _dio!.interceptors.add(_logInterceptor());
    }
    _dio!.interceptors.add(_authInterceptor());
  }

  Future<Response> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;
    try {
      switch (method) {
        case Method.POST:
          {
            response = await _dio!.post(url, data: params);
            break;
          }
        case Method.GET:
          response = await _dio!.get(url, queryParameters: params);
          break;
        case Method.PUT:
          response = await _dio!.put(url, data: params);
          break;
        case Method.DELETE:
          response = await _dio!.delete(url, queryParameters: params);
          break;
        case Method.PATCH:
          response = await _dio!.patch(url);
          break;
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw AuthException();
      } else if (response.statusCode == 500) {
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

  Future<ApiResponse> requestCustomResponse(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;
    try {
      switch (method) {
        case Method.POST:
          {
            response = await _dio!.post(url, data: params);
            break;
          }
        case Method.GET:
          response = await _dio!.get(url, queryParameters: params);
          break;
        case Method.PUT:
          response = await _dio!.put(url, data: params);
          break;
        case Method.DELETE:
          response = await _dio!.delete(url, queryParameters: params);
          break;
        case Method.PATCH:
          response = await _dio!.patch(url);
          break;
      }

      var statusCode = response.statusCode;

      if (statusCode == 200) {
        return ApiResponseSuccess(data: response.data);
      } else if (statusCode == 400) {
        return ApiResponseFailed(
          error: BadRequestException(),
        );
      } else if (statusCode == 401) {
        return ApiResponseFailed(
          error: AuthException(),
          errorBody: response.data,
        );
      } else if (statusCode == 403) {
        return ApiResponseFailed(
          error: ForbiddenException(),
        );
      } else if (statusCode != null && statusCode >= 500) {
        return ApiResponseFailed(
          error: ServerErrorException(),
          errorBody: response.data,
        );
      } else {
        return ApiResponseFailed(
          error: UnknownException(),
          errorBody: response.data,
        );
      }
    } on SocketException catch (e) {
      logger.e(e);
      return ApiResponseFailed(error: NoNetworkException());
    } on FormatException catch (e) {
      logger.e(e);
      return ApiResponseFailed(error: BadFormatException());
    } on DioError catch (e) {
      logger.e(e);
      return ApiResponseFailed(error: UnknownException(message: e.message));
    } catch (e) {
      logger.e(e);
      return ApiResponseFailed(error: UnknownException(message: e.toString()));
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
