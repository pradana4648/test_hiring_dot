import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/screen_bloc.dart';
import 'package:test_hiring_dot/pages/home_page.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenBloc = ScreenBloc();
    return MaterialApp(
      title: 'Test Hiring',
      home: Scaffold(
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
        body: HomeScreen(screenBloc: screenBloc),
      ),
    );
  }
}
