/// This is used to configure the `FancyDioInspector` package.
class FancyDioInspectorOptions {
  /// It controls whether to log requests or not.
  final bool logRequests;

  /// It controls whether to log responses or not.
  final bool logResponses;

  /// It controls whether to log errors or not.
  final bool logErrors;

  /// It controls the maximum number of logs to be stored.
  final int maxLogs;

  const FancyDioInspectorOptions({
    this.logRequests = true,
    this.logResponses = true,
    this.logErrors = true,
    this.maxLogs = 50,
  });
}
