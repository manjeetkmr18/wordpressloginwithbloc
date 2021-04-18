import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_bloc/business_logic/register_bloc/register_bloc.dart';

import 'register.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
      height: height, 
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  RegisterHeaderTitle(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(child: BlocProvider(
                    create: (context) => RegisterBloc(),
                    child: RegisterForm(),
                  )), 
                  // SizedBox(height: height * .15),
                  AlreadyHaveAccountLabel(),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}