import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/app/shared/auth/auth_service.dart';

void main() {
  late AuthService auth;

  setUp(() {
    auth = AuthService();
  });

  group('register validation', () {
    test(
        'should return an error message when the e-mail or password are invalid',
        () {
      final result = auth.register('gabriel', '123');

      expect(result, isA<String>()); //Checa se o resultado é do tipo String.
    });

    test(
        'should return null when the e-mail and password are valid',
            () {
          final result = auth.register('gabrielpirespa@hotmail.com', 'GabrielOlavo2');

          expect(result, isNull); //Checa se o resultado é null.
        });
  });
}
