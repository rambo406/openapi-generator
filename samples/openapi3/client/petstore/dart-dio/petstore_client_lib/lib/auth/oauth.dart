//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.7

// ignore_for_file: unused_import

import 'dart:async';
import 'package:openapi/auth/auth.dart';
import 'package:dio/dio.dart';

class OAuthInterceptor extends AuthInterceptor {
    Map<String, String> tokens = {};

    @override
    Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
        final authInfo = getAuthInfo(options, 'oauth');
        for (final info in authInfo) {
            final token = tokens[info['name']];
            if (token != null) {
                options.headers['Authorization'] = 'Bearer ${token}';
                break;
            }
        }
    await super.onRequest(options, handler);
    }
}
