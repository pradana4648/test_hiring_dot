import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.screenBloc}) : super(key: key);

  final ScreenBloc screenBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: screenBloc.getStreamIndex,
      builder: (context, snapshot) {
        return screenBloc.homeWidgets.elementAt(snapshot.data ?? 0);
      },
    );
  }
}
