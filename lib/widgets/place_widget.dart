import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Column(
            children: List.generate(
              10,
              (index) => Card(
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: const Center(
                        child: FlutterLogo(
                      size: double.infinity,
                    )),
                  ),
                  title: Text('Name $index'),
                  subtitle: const Text('Nulla ut esse aliquip ad non.'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
