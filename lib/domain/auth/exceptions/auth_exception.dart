import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
sealed class AuthException with _$AuthException implements Exception {
  const factory AuthException.unknown() = AuthUnknown;
  const factory AuthException.authRequired() = AuthAuthRequired;
  const factory AuthException.emailNotFound() = AuthEmailNotFound;
  const factory AuthException.passwordNotFound() = AuthPasswordNotFound;
  const factory AuthException.invalidCredential() = AuthInvalidCredential;
  const factory AuthException.tooManyFailedAttempts() =
      AuthTooManyFailedAttempts;
  const factory AuthException.invalidVerificationCode() =
      AuthInvalidVerificationCode;
  const factory AuthException.unableToCreateAccount() =
      AuthUnableToCreateAccount;
  const factory AuthException.expiredVerificationCode() =
      AuthExpiredVerificationCode;
  const factory AuthException.userNotFound() = AuthUserNotFound;
  const factory AuthException.userCreationDenied() = AuthUserCreationDenied;
  const factory AuthException.internalError() = AuthInternalError;
  const factory AuthException.blocked() = AuthBlocked;
  const factory AuthException.unableToSendMail() = AuthUnableToSendMail;
  const factory AuthException.newEmailHaveAccount() = AuthNewEmailHaveAccount;
  const factory AuthException.noEmailUpdateRequestFound() =
      AuthNoEmailUpdateRequestFound;
}
