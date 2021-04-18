import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_bloc/business_logic/auth_bloc/auth_bloc.dart';
import 'package:wordpress_bloc/business_logic/register_bloc/register_bloc.dart';
import 'package:wordpress_bloc/data/api_services.dart';

import 'register.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _emailctrl = TextEditingController();
  TextEditingController _passctrl = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  String? email, password;
  ApiService _apiService = ApiService();

  @override
    void dispose() {
        _emailctrl.dispose();
        _passctrl.dispose();
        _firstname.dispose();
        _lastname.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Loading')),
            );
        }
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
        if (state is RegisterSucessFull) {
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
          RegisterEntryField(
            title: 'First Name',
            isPassword: false,
            ctrl: _firstname,
            keyboard: TextInputType.emailAddress,
            changed: (username) {
              email = username;
            },
          ),
          RegisterEntryField(
            title: 'Last Name',
            isPassword: false,
            ctrl: _lastname,
            keyboard: TextInputType.emailAddress,
            changed: (username) {
              email = username;
            },
          ),
          RegisterEntryField(
            title: 'Email id',
            isPassword: false,
            ctrl: _emailctrl,
            keyboard: TextInputType.emailAddress,
            changed: (username) {
              email = username;
            },
          ),
          RegisterEntryField(
            title: 'Password',
            isPassword: true,
            ctrl: _passctrl,
            keyboard: TextInputType.visiblePassword,
            changed: (pass) {
              password = pass;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          InkWell(
            onTap: () {
              context.read<RegisterBloc>().add(RegisterSubmitted(
                  _emailctrl.text,
                  _passctrl.text,
                  _firstname.text,
                  _lastname.text));
              _emailctrl.clear();
              _passctrl.clear();
              _firstname.clear();
              _lastname.clear();
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
                'SignUp',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
