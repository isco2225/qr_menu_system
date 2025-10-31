import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_exception.freezed.dart';

@freezed
sealed class ProductException with _$ProductException implements Exception {
  /// Unknown product error
  const factory ProductException.unknown() = ProductUnknown;

  /// Authentication required for product action
  const factory ProductException.authRequired() = ProductAuthRequired;

  /// No product found
  const factory ProductException.noProductFound() = ProductNoProductFound;

  /// Operation not permitted
  const factory ProductException.noPermission() = ProductNoPermission;

  /// Internal error
  const factory ProductException.internalError() = ProductInternalError;

  /// Action blocked
  const factory ProductException.blocked() = ProductBlocked;
}
