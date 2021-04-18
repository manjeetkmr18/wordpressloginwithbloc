import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordpress_bloc/business_logic/login_bloc/login_bloc.dart';
import 'package:wordpress_bloc/presentation/widgets/bezierContainer.dart';
import 'login.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {

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
                  HeaderTitle(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(child: BlocProvider(
                    create: (context) => LoginBloc(),
                    child: LoginForm(),
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){},
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),  
                  SizedBox(height: height * .15),
                  CreateAccountLabel(),
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