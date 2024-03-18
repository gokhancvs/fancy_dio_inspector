## 1.7.0

- Add `showSearch` to `FancyDioInspectorTileOptions` in order to be able to toggle the search field. [#9](https://github.com/gokhancvs/fancy_dio_inspector/pull/9)
- Upgrade [Dio](https://pub.dev/packages/dio) from `5.3.3` to `5.4.1`.

## 1.6.1

- Improve theme support.

## 1.6.0

- **NEW FEATURE:** Add `themeData` parameter to `FancyDioInspectorView` in order to override the default theme.

## 1.5.2

- Upgrade [Dio](https://pub.dev/packages/dio) from `5.2.0` to `5.3.3`.

## 1.5.1

- **NEW FEATURE:** Show elapsed duration to the response and error models.

## 1.5.0

- **NEW FEATURE:** Add `l10nOptions` parameter to `FancyDioInspectorView` in order to localize the inspector view.

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
