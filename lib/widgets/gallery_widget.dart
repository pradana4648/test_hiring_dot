import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/gallery_bloc.dart';
import 'package:test_hiring_dot/models/gallery.dart';
import 'package:test_hiring_dot/repositories/gallery_repository.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final galleryBloc = GalleryBloc(repository: GalleryRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          StreamBuilder<List<Gallery>>(
              stream: galleryBloc.getStreamGalleries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final galleries = snapshot.data!;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4 / 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: galleries[index].image.isEmpty
                            ? const FlutterLogo(
                                size: double.infinity,
                              )
                            : Image.network(galleries[index].image),
                      );
                    },
                    itemCount: galleries.length,
                  );
                }
                return const Text('No Data Available');
              })
        ],
      ),
    );
  }
}
