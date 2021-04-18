import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_bloc/business_logic/auth_bloc/auth_bloc.dart';
import 'package:wordpress_bloc/presentation/screen/home/home_screen.dart';
import 'package:wordpress_bloc/presentation/screen/login/login_screen.dart';
import 'package:wordpress_bloc/presentation/screen/splash/splash_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen();
        }
        if (state is UnAuthenticated) {
          return LoginScreen();
        }
        if (state is AuthFailure) {
          return Material(
              child: Container(
            child: Center(
              child: Text(state.error),
            ),
          ));
        }
        return SplashScreen();
      },
    );
  }
}
