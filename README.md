# Fancy Dio Inspector

A [Dio](https://pub.dev/packages/dio) inspector that allows you to log & copy every request, response and error.

<img src="https://raw.githubusercontent.com/gokhancvs/fancy_dio_inspector/main/assets/screenshots/screenshot_1.png" height="500px">

---

## Getting Started

Add dependency to your `pubspec.yaml` file.

```dart
dependencies:
  fancy_dio_inspector: ^1.7.0
```

## Initialization

Add `FancyDioInterceptor` to your Dio instance in order to catch every request, response and error.

```dart
final dio = Dio();

dio.interceptors.add(FancyDioInterceptor());
```

## Usage

Add `FancyDioInspectorView` to your widget tree.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        endDrawer: kDebugMode ? FancyDioInspectorView() : null,
        body: Center(child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

## Authors

- [Gökhan Çavuş](https://github.com/gokhancvs)
- [Yakup Emeksiz](https://github.com/yakupemeksiz)

## Contributions

- [Patrick Chrestin](https://github.com/PatrickChrestin)
