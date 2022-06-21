import 'dart:async';

import 'package:test_hiring_dot/models/place.dart';
import 'package:test_hiring_dot/repositories/place_repository.dart';

class PlaceBloc {
  PlaceBloc({required this.repository}) {
    getPlaces();
  }

  final PlaceRepository repository;
  final _controller = StreamController<List<Place>>.broadcast();

  Stream<List<Place>> get getStreamPlaces => _controller.stream;

  void getPlaces() async {
    final places = await repository.getPlaces();
    _controller.sink.add(places);
  }
}
