import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_crud/core/controller/user_provider.dart';
import '../../../../services/network.dart';
import '../../../../utils/app_dialogs.dart';
import '../../../../utils/app_navigation.dart';
import '../../../../utils/constant.dart';
import '../../services/network_strings.dart';
import '../model/user_model.dart';

class UserBloc {
  Response? _response;
  VoidCallback? _onSuccess, _onFailure;
  UserProvider? userProvider = Cn<UserProvider>().c;

  // Get User Data
  void getUserData({
    required BuildContext context,
    required VoidCallback setProgressBar,
  }) async {
    setProgressBar();
    _onFailure = () {
      AppNavigation.navigatorPop(context);
    };

    _response = await Network().getRequest(
      endPoint: NetworkStrings.GET_USER_ENDPOINT,
      context: context,
      onFailure: _onFailure,
    );

    _onSuccess = () {
      AppNavigation.navigatorPop(context);
      try {
        if (_response!.data != null) {
          userProvider?.clearUserDataList();
          _response!.data.forEach((element) {
            userProvider?.addDataInUserList(
                userData: UserData.fromJson(element));
          });
        }
      } catch (error) {
        AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
      }
    };

    _validateResponse();
  }

  // Validate Response
  void _validateResponse() {
    if (_response != null) {
      Network().validateResponse(
        response: _response,
        onSuccess: _onSuccess,
        onFailure: _onFailure,
      );
    }
  }
}
