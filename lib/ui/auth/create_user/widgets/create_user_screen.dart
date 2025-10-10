import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:fiap_farms/ui/auth/create_user/stores/create_user_store.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/ui/core/widgets/widgets.dart';
import 'package:fiap_farms/routing/routes.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final CreateUserStore _store = sl<CreateUserStore>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        leading: IconButton(
          onPressed: () => context.go(Routes.login),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    onChanged: _store.setFullName,
                    labelText: 'Nome completo',
                    errorText: _store.fullNameError,
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    onChanged: _store.setFarmName,
                    labelText: 'Nome da fazenda',
                    errorText: _store.farmNameError,
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    onChanged: _store.setEmail,
                    labelText: 'E-mail',
                    errorText: _store.emailError,
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    onChanged: _store.setPhone,
                    labelText: 'Telefone',
                    errorText: _store.phoneError,
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
                    onPressed: _store.createUser,
                    text: 'Criar conta',
                    isLoading: _store.isLoading,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
