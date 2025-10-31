import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
sealed class Auth with _$Auth {
  const factory Auth({
    required int id,
    required String email,
  }) = _Auth;
  const Auth._();

  factory Auth.fromJson(Map<String, Object?> json) => _$AuthFromJson(
        json,
      );
  factory Auth.empty() => const Auth(
        email: '',
        id: -1,
      );

  bool isSignedIn() => this != Auth.empty();
}
