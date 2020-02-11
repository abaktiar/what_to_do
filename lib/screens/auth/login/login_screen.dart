import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_to_do/screens/auth/login/bloc/login_bloc.dart';
import 'login_form.dart';
import 'package:what_to_do/services/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService;

  LoginScreen({Key key, @required AuthService authService})
      : assert(authService != null),
        _authService = authService,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authService: _authService),
        child: LoginForm(authService: _authService),
      ),
    );
  }
}
