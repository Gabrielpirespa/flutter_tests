import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/app/pages/register_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e-mail TextFormField tests', () {
    testWidgets(
        'Should pass when the e-mail TextField shows correctly on the screen',
            (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));

          expect(emailKey, findsOneWidget);
        });

    testWidgets('Should exhibit an error SnackBar when the e-mail is null',
            (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton); //realiza o clique no registrar
          await tester
              .pumpAndSettle(); //renderiza as ações após o clique e deixa tudo pronto para a próxima ação do teste

          expect(find.text('O e-mail é obrigatório'), findsOneWidget);
        });

    testWidgets('Should exhibit an error SnackBar when the e-mail is empty',
            (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField); //clica no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          await tester.enterText(
              emailField, ''); //coloca um texto vazio no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton); //realiza o clique no registrar
          await tester
              .pumpAndSettle(); //renderiza as ações após o clique e deixa tudo pronto para a próxima ação do teste

          expect(find.text('O e-mail é obrigatório'), findsOneWidget);
        });

    testWidgets('Should exhibit an error SnackBar when the e-mail is invalid',
            (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField); //clica no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          await tester.enterText(
              emailField, 'gabriel'); //coloca um texto vazio no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton); //realiza o clique no registrar
          await tester
              .pumpAndSettle(); //renderiza as ações após o clique e deixa tudo pronto para a próxima ação do teste

          expect(find.text('O e-mail inserido é inválido'), findsOneWidget);
        });

    testWidgets("Shouldn't exhibit an error SnackBar when the e-mail is valid",
            (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField); //clica no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          await tester.enterText(
              emailField, 'gabrielpirespa@hotmail.com'); //coloca um texto válido no form do e-mail
          await tester.pumpAndSettle(); //renderiza

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton); //realiza o clique no registrar
          await tester.pumpAndSettle(); //renderiza as ações após o clique e deixa tudo pronto para a próxima ação do teste

          expect(find.text('O e-mail inserido é inválido'), findsNothing);
        });
  });

  group('testes do campo de senha', () {
    testWidgets(
      'Should pass when the password TextField shows correctly on the screen',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final passwordField = find.byKey(const Key('password_key'));

        expect(passwordField, findsOneWidget);
      },
    );

    testWidgets(
      'Should exhibit an error Snackbar when the password is null',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('A senha é obrigatória'), findsOneWidget);
      },
    );

    testWidgets(
      'Should exhibit an error Snackbar when the password is empty',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, '');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('A senha é obrigatória'), findsOneWidget);
      },
    );

    testWidgets(
      'Should exhibit an error SnackBar when the password has less than six characters',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'ana');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve ser alfanumérica e ter no mínimo 6 caracteres'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Should exhibit an error SnackBar when the password isn't alphanumeric",
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'william');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve ser alfanumérica'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Shouldn't exhibit an error SnackBar when the password is valid",
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'william123');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve ser alfanumérica'),
          findsNothing,
        );
      },
    );
  });

  group('testes do botão de cadastro',() {
    testWidgets(
      'Should pass when the register button shows on the screen',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final registerButton = find.byKey(const Key('register_button_key'));

        expect(registerButton, findsOneWidget);
      },
    );

    testWidgets(
      'Should exhibit an error SnackBar when clicked in register with an invalid e-mail and a password',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, '123');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.byType(SnackBar),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Shouldn't exhibit an error SnackBar when clicked on register with an valid e-mail and password",
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'william@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'william123');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.byType(SnackBar),
          findsNothing,
        );
      },
    );
  });

}
