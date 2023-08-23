import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/app/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group('password validation', () {
    test('should return an error message when the password is null', () {
      final result = passwordValidator.validate();

      expect(result, equals('A senha é obrigatória'));
    });

    test('should return an error message when the password is empty', () {
      final result = passwordValidator.validate(password: '');

      expect(result, equals('A senha é obrigatória'));
    });

    test('should return an error message when the password length is lower than six characters', () {
      final result = passwordValidator.validate(password: 'gab');

      expect(result, equals('A senha deve ser alfanumérica e ter no mínimo 6 caracteres'));
    });

    test("should return an error message when the password isn't alphanumeric", () {
      final result = passwordValidator.validate(password: 'gabriel');

      expect(result, equals('A senha deve ser alfanumérica'));
    });

    test("should return null when the password is valid", () {
      final result = passwordValidator.validate(password: 'gabriel2');

      expect(result, isNull);
    });
  });
}
