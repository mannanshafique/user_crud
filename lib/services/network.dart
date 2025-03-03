// ignore_for_file: use_build_context_synchronously, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_crud/services/network_strings.dart';
import 'package:user_crud/utils/app_strings.dart';
import '../utils/app_dialogs.dart';
import '../utils/app_navigation.dart';
import 'connectivity_manager.dart';

class Network {
  static Dio? _dio;
  static CancelToken? _cancelRequestToken;

  static Network? _network;

  static ConnectivityManager? _connectivityManager;

  Network._createInstance();

  factory Network() {
    // factory with constructor, return some value
    if (_network == null) {
      _network = Network
          ._createInstance(); // This is executed only once, singleton object

      _dio = _getDio();
      _cancelRequestToken = _getCancelToken();

      _connectivityManager = ConnectivityManager();
    }
    return _network!;
  }

  static Dio _getDio() {
    return _dio ??= Dio();
  }

  static CancelToken _getCancelToken() {
    return _cancelRequestToken ??= CancelToken();
  }

  ////////////////// Get Request /////////////////////////
  Future<Response?> getRequest({
    required BuildContext context,
    required String endPoint,
    VoidCallback? onFailure,
    Duration connectTimeOut = const Duration(milliseconds: 30000),
  }) async {
    Response? response;

    // if (await _connectivityManager!.isInternetConnected()) {
    try {
      _dio?.options.connectTimeout = connectTimeOut;
      response = await _dio!.get(NetworkStrings.API_BASE_URL + endPoint,
          cancelToken: _cancelRequestToken,
          options: Options(
            headers: {
              'Accept': NetworkStrings.ACCEPT,
            },
            sendTimeout: connectTimeOut,
            receiveTimeout: connectTimeOut,
          ));
    } on DioException catch (e) {
      log("Error:${e.response.toString()}");
      _validateException(
        response: e.response,
        context: context,
        onFailure: onFailure,
      );
    }
    // } else {
    //   _noInternetConnection(onFailure: onFailure);
    // }

    return response;
  }

  ////////////////// Validate Response /////////////////////
  void validateResponse({
    Response? response,
    VoidCallback? onSuccess,
    VoidCallback? onFailure,
  }) {
    var validateResponseData = response?.data;

    if (validateResponseData != null) {
      if (response!.statusCode == NetworkStrings.SUCCESS_CODE) {
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        if (onFailure != null) {
          onFailure();
        }
      }
    }
  }

  ////////////////// Validate Exception /////////////////////
  void _validateException(
      {required BuildContext context,
      Response? response,
      VoidCallback? onFailure}) {
    log("Response:${response.toString()}");
    if (onFailure != null) {
      onFailure();
    }
    if (response?.statusCode == NetworkStrings.BAD_REQUEST_CODE) {
      AppDialogs.showToast(message: NetworkStrings.BAD_REQUEST_CODE_TEXT);
    } else if (response?.statusCode == NetworkStrings.FORBIDDEN_CODE) {
      AppDialogs.showToast(message: NetworkStrings.FORBIDDEN_CODE_TEXT);
    } else if (response?.statusCode == NetworkStrings.UNAUTHORIZED_CODE) {
      AppDialogs.showToast(message: NetworkStrings.UNAUTHORIZED_CODE_TEXT);
    } else {
      // AppDialogs.showToast(
      //     message: response?.statusMessage ?? message.toString());
    }
  }

  ////////////////// No Internet Connection /////////////////////
  void _noInternetConnection({VoidCallback? onFailure}) {
    if (onFailure != null) {
      onFailure();
    }
    AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
  }
}
