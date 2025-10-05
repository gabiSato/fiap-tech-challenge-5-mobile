import 'package:fiap_farms/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
        leading: IconButton(
          onPressed: () => context.go(Routes.login),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Nome completo'),
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(labelText: 'Nome da fazenda'),
              ),
              const SizedBox(height: 24),
              const TextField(decoration: InputDecoration(labelText: 'E-mail')),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              FilledButton(onPressed: () {}, child: const Text('Criar conta')),
            ],
          ),
        ),
      ),
    );
  }
}
