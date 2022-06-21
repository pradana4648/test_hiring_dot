import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_hiring_dot/widgets/gallery_widget.dart';
import 'package:test_hiring_dot/widgets/place_widget.dart';
import 'package:test_hiring_dot/widgets/user_widget.dart';

class ScreenBloc {
  // Current index screen
  final _homeWidgets = [
    const PlaceWidget(),
    const GalleryWidget(),
    const UserWidget()
  ];
  final _controller = StreamController<int>.broadcast();

  Stream<int> get getStreamIndex => _controller.stream;

  List<Widget> get homeWidgets => _homeWidgets;

  void onChangeIndex(int index) {
    _controller.sink.add(index);
  }
}
