import 'package:flutter/material.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({Key? key}) : super(key: key);

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
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(color: Colors.red);
            },
            itemCount: 15,
          )
        ],
      ),
    );
  }
}
