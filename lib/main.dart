import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_to_do/screens/auth/login/login_screen.dart';
import 'package:what_to_do/screens/home/home_screen.dart';
import 'package:what_to_do/services/auth/auth_service.dart';
import 'package:what_to_do/authentication_bloc/bloc.dart';
import 'package:what_to_do/screens/common/splash_screen.dart';
import 'package:what_to_do/simple_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final AuthService authService = AuthService();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        authService: authService,
      )..add(AppStarted()),
      child: App(authService: authService),
    ),
  );
}

class App extends StatelessWidget {
  final AuthService _authService;

  App({Key key, @required AuthService authService})
      : assert(authService != null),
        _authService = authService,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(authService: _authService);
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          return SplashScreen();
        },
      ),
    );
  }
}
