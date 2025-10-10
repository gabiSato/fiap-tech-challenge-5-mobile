import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:fiap_farms/routing/routes.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/utils/result.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final WebViewController _controller = WebViewController();

  bool _isLoading = true;
  String? _errorMessage;
  final GetCurrentUserUseCase _getCurrentUserUseCase =
      sl<GetCurrentUserUseCase>();

  static const String _prodBaseUrl =
      'https://develop.d3voex5v3mawse.amplifyapp.com';

  String get _baseUrl => _prodBaseUrl;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      final result = await _getCurrentUserUseCase();

      String? userId;
      switch (result) {
        case Ok(value: final user):
          userId = user?.id;
        case Error(error: final error):
          if (mounted) {
            setState(() {
              _errorMessage = 'Erro ao obter usuário: ${error.toString()}';
              _isLoading = false;
            });
          }
          return;
      }

      if (userId == null) {
        if (mounted) {
          setState(() {
            _errorMessage = 'Usuário não autenticado';
            _isLoading = false;
          });
        }
        return;
      }

      final mapUrl = _baseUrl;

      _controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..enableZoom(true)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = true;
                });
              }
            },
            onPageFinished: (String url) async {
              await Future.delayed(const Duration(milliseconds: 500));
              await _controller.runJavaScript('''
                (function() {
                  try {
                    if (window.location.pathname === '/' || window.location.pathname === '') {
                      const newPath = '/$userId';
                      window.history.pushState({}, '', newPath);
                      window.dispatchEvent(new PopStateEvent('popstate', { state: {} }));
                    }
                  } catch (error) {
                    console.error('Navigation error:', error);
                  }
                })();
              ''');

              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Erro ao carregar recurso: ${error.description}',
                    ),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(mapUrl));

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Erro ao inicializar mapa: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        leading: IconButton(
          onPressed: () => context.go(Routes.home),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          if (_errorMessage == null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _controller.reload();
              },
              tooltip: 'Recarregar',
            ),
        ],
      ),
      body: _errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Erro ao carregar mapa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _errorMessage = null;
                          _isLoading = true;
                        });
                        _initializeMap();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
    );
  }
}
