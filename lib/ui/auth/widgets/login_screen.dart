import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Bem vindo ao ',
                    style: Theme.of(context).textTheme.titleLarge,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Farms',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                const TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                const SizedBox(height: 24),
                const TextField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                FilledButton(onPressed: () {}, child: const Text('Entrar')),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não tem uma conta?'),
                    TextButton(onPressed: () {}, child: Text('Cadastre-se')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
