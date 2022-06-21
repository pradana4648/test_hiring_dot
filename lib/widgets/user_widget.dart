import 'package:flutter/material.dart';
import 'package:test_hiring_dot/bloc/user_bloc.dart';
import 'package:test_hiring_dot/models/user.dart';
import 'package:test_hiring_dot/repositories/user_repository.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = UserBloc(repository: UserRepository());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: StreamBuilder<User>(
          stream: userBloc.getStreamUser,
          builder: (context, snapshot) {
            final user = snapshot.data;
            return ListView(
              children: [
                AspectRatio(
                  aspectRatio: 21 / 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      backgroundImage: user?.avatar != null
                          ? NetworkImage(user!.avatar)
                          : null,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Username'),
                  subtitle: Text(user?.username ?? '<Kosong>'),
                ),
                ListTile(
                  title: const Text('Nama lengkap'),
                  subtitle: Text(user?.fullName ?? '<Kosong>'),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(user?.email ?? '<Kosong>'),
                ),
                ListTile(
                  title: const Text('No Telp'),
                  subtitle: Text(user?.phone ?? '<Kosong>'),
                ),
              ],
            );
          }),
    );
  }
}
