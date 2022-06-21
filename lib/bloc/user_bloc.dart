import 'dart:async';

import 'package:test_hiring_dot/repositories/user_repository.dart';

import '../models/user.dart';

class UserBloc {
  UserBloc({required this.repository}) {
    getUser();
  }

  final UserRepository repository;
  final _controller = StreamController<User>.broadcast();

  Stream<User> get getStreamUser => _controller.stream;

  void getUser() async {
    final user = await repository.getUser();
    _controller.sink.add(user);
  }
}
