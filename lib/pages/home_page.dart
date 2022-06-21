import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenBloc = ScreenBloc();
    return Scaffold(
      bottomNavigationBar: StreamBuilder<int>(
          stream: screenBloc.getStreamIndex,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: snapshot.data ?? 0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.place), label: 'Place'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.browse_gallery), label: 'Gallery'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'User'),
              ],
              onTap: (index) {
                screenBloc.onChangeIndex(index);
              },
            );
          }),
      body: StreamBuilder<int>(
        stream: screenBloc.getStreamIndex,
        builder: (context, snapshot) {
          return screenBloc.homeWidgets.elementAt(snapshot.data ?? 0);
        },
      ),
    );
  }
}
