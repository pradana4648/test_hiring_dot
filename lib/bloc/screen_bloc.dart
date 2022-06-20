import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_hiring_dot/widgets/gallery.dart';
import 'package:test_hiring_dot/widgets/place.dart';
import 'package:test_hiring_dot/widgets/user.dart';

class ScreenBloc {
  // Current index screen
  final _homeWidgets = [const Place(), const Gallery(), const User()];
  final _controller = StreamController<int>.broadcast();

  Stream<int> get getStreamIndex => _controller.stream;

  List<Widget> get homeWidgets => _homeWidgets;

  void onChangeIndex(int index) {
    _controller.sink.add(index);
  }

  void close() {
    _controller.close();
  }
}
