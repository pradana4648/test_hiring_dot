import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/place_bloc.dart';
import 'package:test_hiring_dot/repositories/place_repository.dart';

import '../models/place.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeBloc = PlaceBloc(repository: PlaceRepository());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place'),
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
          StreamBuilder<List<Place>?>(
            stream: placeBloc.getStreamPlaces,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final places = snapshot.data!;
                return Column(
                  children: places
                      .map(
                        (data) => Card(
                          child: ListTile(
                            leading: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 100),
                                child: data.image.isEmpty
                                    ? const FlutterLogo(size: double.infinity)
                                    : Image.network(data.image)),
                            title: Text(data.title),
                            subtitle: Text(data.content),
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return const Text('No Data Available');
            },
          ),
        ],
      ),
    );
  }
}
