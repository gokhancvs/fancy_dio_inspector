## 1.4.1

- Fix Flutter Web's truncate issue. [#3](https://github.com/gokhancvs/fancy_dio_inspector/pull/3)

## 1.4.0

- **NEW FEATURE:** Add `consoleOptions` parameter to `FancyDioInspectorOptions` in order to print requests, responses and errors to the console.

## 1.3.0

- **BREAKING CHANGE:** Remove `FancyDioInspectorView`'s `onClosePressed` parameter.
- Add `leading` and `actions` parameters to `FancyDioInspectorView` in order to give more control over the app bar.

## 1.2.3

- Upgrade Dart SDK version from `<3.0.0` to `<4.0.0`.

## 1.2.2

- Upgrade [Dio](https://pub.dev/packages/dio) from `5.1.2` to `5.2.0`.

## 1.2.1

- Downgrade Dart SDK version from `2.19.6` to `2.17.6`.
- Upgrade Flutter SDK version from `1.17.0` to `3.0.5`.

## 1.2.0

- **BREAKING CHANGE:** `FancyDioInterceptor`'s `options` parameter is now a named parameter instead of a positional parameter.
- Add `OnRequestCreated`, `OnResponseCreated` and `OnErrorCreated` callbacks to `FancyDioInterceptor`.

## 1.1.0

- Upgrade [Dio](https://pub.dev/packages/dio) from `4.0.6` to `5.1.2`.

## 1.0.0

- Initial release.
