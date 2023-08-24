import 'dart:convert';

// import 'package:dio/dio.dart' as DiO;
import 'package:get/get.dart' as GetX;
import 'package:popcorn_sound_mobile/services/response/app_errors.dart';

class AppResponse {
  static T? getResponse<T>(GetX.Response<T> response) {
    final status = response.status;
    try {
      if (response.isOk) {
        dynamic statusCode = status.code;
        String message = "Errors";
        if (statusCode == 200) {
          return response.body;
        } else {
          if (statusCode == 400) {
            throw BadRequestError(messageResponse: message);
          } else if (statusCode == 401) {
            throw UnAuthorizeError(messageResponse: message);
          } else if (statusCode == 403) {
            throw ForbiddenError(messageResponse: message);
          } else if (statusCode == 404) {
            throw NotFoundError(messageResponse: message);
          } else if (statusCode == 422) {
            throw ValidateError(messageResponse: message);
          } else {
            throw UnknownError(messageResponse: message);
          }
        }
      } else {
        if (status.isServerError) {
          throw ServerError();
        } else if (status.connectionError) {
          throw NoConnectionError();
        } else if (status.isUnauthorized) {
          throw UnAuthorizeError();
        } else if (status.isForbidden) {
          throw ForbiddenError();
        } else if (status.isNotFound) {
          throw NotFoundError();
        } else {
          throw UnknownError();
        }
      }
    } catch (e) {
      throw e;
    }
  }

  // static T? getResponseDiO<T>(DiO.Response<T> response) {
  //   try {
  //     int? httpCode = response.statusCode;
  //     if (httpCode != null) {
  //       if (httpCode >= 200 && httpCode <= 209) {
  //         Map<String, dynamic> res = response.data as Map<String, dynamic>;
  //         int statusCode = res['status_code'];
  //         final message = res['message'];
  //         if (statusCode == 200) {
  //           return response.data;
  //         } else if (statusCode == 400) {
  //           throw BadRequestError(messageResponse: message);
  //         } else if (statusCode == 401) {
  //           throw UnAuthorizeError(messageResponse: message);
  //         } else if (statusCode == 403) {
  //           throw ForbiddenError(messageResponse: message);
  //         } else if (statusCode == 404) {
  //           throw NotFoundError(messageResponse: message);
  //         } else if (statusCode == 422) {
  //           throw ValidateError(messageResponse: message);
  //         } else {
  //           throw UnknownError(messageResponse: message);
  //         }
  //       } else if (httpCode == 400) {
  //         throw BadRequestError();
  //       } else if (httpCode == 401) {
  //         throw UnAuthorizeError();
  //       } else if (httpCode == 403) {
  //         throw ForbiddenError();
  //       } else if (httpCode == 404) {
  //         throw NotFoundError();
  //       } else if (httpCode == 422) {
  //         throw ValidateError();
  //       } else {
  //         throw UnknownError();
  //       }
  //     } else {
  //       throw UnknownError();
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
