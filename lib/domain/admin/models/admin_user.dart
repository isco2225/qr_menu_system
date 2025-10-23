import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'admin_user.freezed.dart';
part 'admin_user.g.dart';

@freezed
sealed class AdminUser with _$AdminUser {
  const factory AdminUser({
    @Default('') String uid,
    @Default('') String email,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default(AdminUserRole.superAdmin) AdminUserRole role,
  }) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) =>
      _$AdminUserFromJson(json);
}
