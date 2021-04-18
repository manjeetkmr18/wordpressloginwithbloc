import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_bloc/business_logic/login_bloc/login_bloc.dart';
import 'package:wordpress_bloc/data/api_services.dart';

import 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailctrl = TextEditingController();

  TextEditingController _passctrl = TextEditingController();

  String? email, password;

  ApiService _apiService = ApiService();

  @override
  void dispose() {
    _emailctrl.dispose();
    _passctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Loading')),
            );
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      if (state is LoginSucessFull) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('Login Sucessfull')),
            );
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      },
      child: Column(
        children: <Widget>[
          EntryField(
            title: 'Email id',
            isPassword: false,
            ctrl: _emailctrl,
            keyboard: TextInputType.emailAddress,
            changed: (username) {
              // email = username;
            },
          ),
          EntryField(
            title: 'Password',
            isPassword: true,
            ctrl: _passctrl,
            keyboard: TextInputType.visiblePassword,
            changed: (pass) {
              // password = pass;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          InkWell(
            onTap: () {
              print('test');
              if (_emailctrl.text.isNotEmpty && _passctrl.text.isNotEmpty) {
                context
                    .read<LoginBloc>()
                    .add(LoginSubmitted(_emailctrl.text, _passctrl.text));
                _emailctrl.clear();
                _passctrl.clear();
                // Navigator.pushNamed(context, '/home');
              } else {
                print('error');
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xfffbb448), Color(0xfff7892b)])),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
