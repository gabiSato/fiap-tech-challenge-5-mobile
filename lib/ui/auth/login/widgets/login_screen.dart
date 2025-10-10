import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:fiap_farms/ui/auth/login/stores/login_store.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/ui/core/widgets/widgets.dart';
import 'package:fiap_farms/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore _store = sl<LoginStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => _store.errorMessage, (String? message) {
      if (message != null) {
        showErrorSnackBar(context, message);
      }
    });
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Bem vindo ao ',
                        style: Theme.of(context).textTheme.headlineSmall,
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Farms',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    AppTextField(
                      onChanged: _store.setEmail,
                      labelText: 'E-mail',
                      errorText: _store.emailError,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      onChanged: _store.setPassword,
                      labelText: 'Senha',
                      errorText: _store.passwordError,
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    SubmitButton(
                      onPressed: _store.login,
                      text: 'Entrar',
                      isLoading: _store.isLoading,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta?'),
                        TextButton(
                          onPressed: () => context.go(Routes.userRegistration),
                          child: const Text('Cadastre-se'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
