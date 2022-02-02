import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/application/auth/auth_bloc.dart';
import 'package:flutter_app_template/presentation/routes/app_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) => context.router.replace(const HomeRoute()),
          unauthenticated: (_) {
            return context.router.replace(const IntroductionScreenRoute());
          },
        );
      },
      child: _PageWidget(),
    );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.redAccent.withOpacity(0.3),
          child: const Text('Splash screen'),
        ),
      ),
    );
  }
}
