import 'package:flutter/material.dart';
import 'package:wordpress_bloc/data/shred_pref.dart';

class HomeScreen extends StatelessWidget {
  Shared shared = Shared();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () {
            shared.clear();
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          },
        ),
      ),
    );
  }
}
