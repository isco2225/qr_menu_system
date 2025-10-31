import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_exception.freezed.dart';

@freezed
sealed class CategoryException with _$CategoryException implements Exception {
  /// Unknown category error
  const factory CategoryException.unknown() = CategoryUnknown;

  /// Authentication required for category action
  const factory CategoryException.authRequired() = CategoryAuthRequired;

  /// No category found
  const factory CategoryException.noCategoryFound() = CategoryNoCategoryFound;

  /// Operation not permitted
  const factory CategoryException.noPermission() = CategoryNoPermission;

  /// Internal error
  const factory CategoryException.internalError() = CategoryInternalError;

  /// Action blocked
  const factory CategoryException.blocked() = CategoryBlocked;
}
