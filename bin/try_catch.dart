import 'dart:io';

void main() {
  stdout.write('Логин: ');
  String login = stdin.readLineSync()!;

  stdout.write('Пароль: ');
  String password = stdin.readLineSync()!;

  stdout.write('Повторите пароль: ');
  String confirmPassword = stdin.readLineSync()!;

  try {
    check(login, password, confirmPassword);
    print('Все норм');
  } on WrongLoginException catch (e) {
    print(e);
  } on WrongPasswordException catch (e) {
    print(e);
  }
}

class WrongPasswordException {
  String? pass;
  WrongPasswordException({this.pass});
  @override
  String toString() {
    return 'неверный пароль';
  }
}

class WrongLoginException {
  String? login;
  WrongLoginException({this.login});
  @override
  String toString() {
    return 'неверный логин';
  }
}

void check(String login, String password, String confirmPassword) {
  if (login.length > 20) {
    throw WrongLoginException(login: login);
  } else if (password.length >= 20 || password != confirmPassword) {
    throw WrongPasswordException(pass: password);
  }
}