import 'package:dio/dio.dart';
import 'package:example/models/login_request.dart';
import 'package:example/models/login_response.dart';

/// Import the `fancy_dio_inspector` package.
import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:flutter/material.dart';

void main() {
  /// Initialize your `Dio` client.
  DioClient.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  Future<void> login({bool success = true}) async {
    setState(() {
      token = null;
    });

    final response = await DioClient.instance.login(success: success);

    if (response != null) {
      setState(() {
        token = response.token;
      });
    }
  }

  void openDioInspector(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FancyDioInspectorView(
          leading: CloseButton(onPressed: Navigator.of(context).pop),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy Dio Inspector Example',
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Fancy Dio Inspector'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => openDioInspector(context),
                  child: const Text('Open FancyDioInspectorView'),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: login,
                      child: const Text('Success Login'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => login(success: false),
                      child: const Text('Error Login'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Token: $token'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DioClient {
  DioClient._();
  static final DioClient instance = DioClient._();

  late final Dio _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api',
        headers: {
          'Accept': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
      ),
    );

    /// Add the `FancyDioInterceptor` to the `Dio` client.
    _dio.interceptors.add(
      FancyDioInterceptor(
        options: const FancyDioInspectorOptions(
          consoleOptions: FancyDioInspectorConsoleOptions(verbose: true),
        ),
      ),
    );
  }

  Future<LoginResponse?> login({bool success = true}) async {
    final request = LoginRequest(
      email: 'eve.holt@reqres.${success ? 'in' : 'com'}',
      password: 'cityslicka',
    );

    try {
      final response = await _dio.post('/login', data: request.toJson());
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
