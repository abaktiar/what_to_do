import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_to_do/screens/auth/register/bloc/register_bloc.dart';
import 'register_form.dart';
import 'package:what_to_do/services/auth/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService _authService;

  RegisterScreen({Key key, @required AuthService authService})
      : assert(authService != null),
        _authService = authService,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authService: _authService),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
