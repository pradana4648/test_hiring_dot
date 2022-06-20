import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/screen_bloc.dart';
import 'package:test_hiring_dot/pages/home_page.dart';

void main() => runApp(
      MyApp(
        screenBloc: ScreenBloc(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.screenBloc}) : super(key: key);

  final ScreenBloc screenBloc;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    widget.screenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Hiring',
      home: Scaffold(
        bottomNavigationBar: StreamBuilder<int>(
            stream: widget.screenBloc.getStreamIndex,
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
                  widget.screenBloc.onChangeIndex(index);
                },
              );
            }),
        body: HomeScreen(screenBloc: widget.screenBloc),
      ),
    );
  }
}
