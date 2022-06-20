import 'package:flutter_test/flutter_test.dart';

void main() {
  const validEmail = 'test@gmail.com';
  const invalidEmailWithoutDomain = 'test@';
  const invalidEmailName = '@gmail.com';

  const validPassword = 'Bujank123';
  const invalidPasswordWithoutUppercase = 'bujank123';
  const invalidPasswordWithoutLowercase = 'BUJANK123';
  const invalidPasswordwLessMinimum = 'Bj123';

  bool isEmailValid(String input) {
    return RegExp(r'\S+@\S+\.\S+').hasMatch(input);
  }

  bool isPasswordValid(String input) {
    return RegExp(r"^(?=.*[a-z])(?=.*[A-Z]).{6,40}").hasMatch(input);
  }

  group('Testing email', () {
    test('If email is valid format', () {
      expect(isEmailValid(validEmail), true);
    });

    test("If email is invalid format without domain", () {
      expect(isEmailValid(invalidEmailWithoutDomain), false);
    });

    test('If email is invalid format without username', () {
      expect(isEmailValid(invalidEmailName), false);
    });
  });

  group("Testing password", () {
    test("If password is valid format ", () {
      expect(isPasswordValid(validPassword), true);
    });

    test("If password is invalid format without uppercase", () {
      expect(isPasswordValid(invalidPasswordWithoutUppercase), false);
    });

    test("If password is invalid format without lowercase", () {
      expect(isPasswordValid(invalidPasswordWithoutLowercase), false);
    });

    test("If password is invalid format without minimum", () {
      expect(isPasswordValid(invalidPasswordwLessMinimum), false);
    });
  });
}
