import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: ListView(
        children: const [
          AspectRatio(
            aspectRatio: 21 / 9,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            title: Text('Username'),
            subtitle: Text('Test'),
          ),
          ListTile(
            title: Text('Nama lengkap'),
            subtitle: Text('Siap yang pantas'),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('xxxx@domain.com'),
          ),
          ListTile(
            title: Text('No Telp'),
            subtitle: Text('+6286969699'),
          ),
        ],
      ),
    );
  }
}
