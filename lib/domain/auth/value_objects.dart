import 'package:flutter_app_template/domain/core/value_objects.dart';
import 'package:flutter_app_template/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_template/domain/core/failures.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input)
          .flatMap((result) => validateEmailWithoutSpace(result)),
    );
  }

  const EmailAddress._(this.value);

  @override
  final Either<AuthValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(
      validatePasswordLength(input)
          .flatMap((result) => validatePasswordWithoutSpace(result)),
    );
  }

  const Password._(this.value);

  @override
  final Either<AuthValueFailure<String>, String> value;
}
