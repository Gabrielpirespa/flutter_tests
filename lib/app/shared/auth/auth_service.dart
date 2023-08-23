import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

class AuthService {
  register(String? email, String? password) {
    final emailError = EmailValidator().validate(email: email);

    final passwordError = PasswordValidator().validate(password: password);

    return emailError ?? passwordError; // retorna emailError, se for nulo retorna passwordError, se o último for nulo retorna null.
  }
}