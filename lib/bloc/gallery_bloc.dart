import 'dart:async';

import 'package:test_hiring_dot/models/gallery.dart';
import 'package:test_hiring_dot/repositories/gallery_repository.dart';

class GalleryBloc {
  GalleryBloc({required this.repository}) {
    getGallery();
  }

  final GalleryRepository repository;

  final _controller = StreamController<List<Gallery>>.broadcast();

  Stream<List<Gallery>> get getStreamGalleries => _controller.stream;

  void getGallery() async {
    final galleries = await repository.getGalleries();
    _controller.sink.add(galleries);
  }
}
