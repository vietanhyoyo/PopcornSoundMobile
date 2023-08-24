import 'package:get/get.dart';

abstract class AppErrors implements Exception {
  String? get message;

  AppErrors() {
    printInfo(info: message ?? '');
  }
}

class ServerError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'server_error'.tr;
  String? messageResponse;

  ServerError({this.messageResponse});
}

class NoConnectionError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'no_connection_error'.tr;
  String? messageResponse;

  NoConnectionError({this.messageResponse});
}

class UnAuthorizeError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'un_authorized_error'.tr;
  String? messageResponse;

  UnAuthorizeError({this.messageResponse});
}

class ForbiddenError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'forbidden_error'.tr;
  String? messageResponse;

  ForbiddenError({this.messageResponse});
}

class NotFoundError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'not_found_error'.tr;
  String? messageResponse;

  NotFoundError({this.messageResponse});
}

class UnknownError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'unknown_error'.tr;
  String? messageResponse;

  UnknownError({this.messageResponse});
}

class BadRequestError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'bad_request_error'.tr;
  String? messageResponse;

  BadRequestError({this.messageResponse});
}

class ValidateError extends AppErrors {
  @override
  String? get message => messageResponse ?? 'unknown_error'.tr;
  String? messageResponse;

  ValidateError({this.messageResponse});
}
