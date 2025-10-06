import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/auth/stores/login_store.dart';
import 'package:fiap_farms/config/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore _store = sl<LoginStore>();

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void _login() async {
    _store.validateEmail(_store.email);
    _store.validatePassword(_store.password);

    if (_store.isValid && !_store.isLoading) {
      await _store.login();

      if (_store.errorMessage != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_store.errorMessage ?? 'Ocorreu um erro')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
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
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _store.setEmail,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorText: _store.emailError,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 24),
                Observer(
                  builder: (_) => TextFormField(
                    onChanged: _store.setPassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      errorText: _store.passwordError,
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(height: 32),
                Observer(
                  builder: (_) {
                    return FilledButton(
                      onPressed: !_store.isLoading ? _login : null,
                      child: _store.isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Entrar'),
                    );
                  },
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
          ),
        ),
      ),
    );
  }
}
