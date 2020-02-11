import 'package:flutter/material.dart';
import 'package:what_to_do/screens/auth/register/register_screen.dart';
import 'package:what_to_do/services/auth/auth_service.dart';

class CreateAccountButton extends StatelessWidget {
  final AuthService _authService;

  CreateAccountButton({Key key, @required AuthService authService})
      : assert(authService != null),
        _authService = authService,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(authService: _authService);
          }),
        );
      },
    );
  }
}
