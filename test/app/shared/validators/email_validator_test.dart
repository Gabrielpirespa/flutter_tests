import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/app/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group(
    'e-mail validation',
    () {
      test('should return an error message when the e-mail is null', () {
        final result = emailValidator.validate();

        expect(result, equals('O e-mail é obrigatório'));
      });

      test('should return an error message when the e-mail is empty', () {
        final result = emailValidator.validate(email: '');

        expect(result, equals('O e-mail é obrigatório'));
      });

      test('should return an error message when the e-mail is invalid', () {
        final result = emailValidator.validate(email: 'gabriel');

        expect(result, equals('O e-mail inserido é inválido'));
      });

      test('should return null when the e-mail is valid', () {
        final result = emailValidator.validate(email: 'gabrielpirespa@hotmail.com');

        expect(result, isNull);
      });
    },
  );
}
