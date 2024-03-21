import 'package:fancy_dio_inspector/src/l10n/fancy_strings.dart';

class FancyDioInspectorL10nOptions {
  /// [appBarText] is used to change the text of the app bar. Defaults to
  /// `Network Logs`.
  final String appBarText;

  /// [requestsText] is used to change the text of the requests tab. Defaults to
  /// `Requests`.
  final String requestsText;

  /// [responsesText] is used to change the text of the responses tab. Defaults
  /// to `Responses`.
  final String responsesText;

  /// [errorsText] is used to change the text of the errors tab. Defaults to
  /// `Errors`.
  final String errorsText;

  /// [searchHintText] is used to change the hint text of the search field.
  /// Defaults to `Search`.
  final String searchHintText;

  /// [cURLText] is used to change the cURL text. Defaults to `cURL`.
  final String cURLText;

  /// [copyText] is used to change the text of the copy button. Defaults to
  /// `Copy`.
  final String copyText;

  /// [copiedText] is used when the copy button is pressed. Defaults to
  /// `Copied`.
  final String copiedText;

  /// [cURLCopiedText] is used when the cURL button is pressed. Defaults to
  /// `cURL Copied`.
  final String cURLCopiedText;

  /// [urlTitleText] is used where the url is displayed. Defaults to `URL`.
  final String urlTitleText;

  /// [requestTitleText] is used where the request is displayed. Defaults to
  /// `REQUEST BODY`.
  final String requestTitleText;

  /// [headersTitleText] is used where the headers are displayed. Defaults to
  /// `HEADERS`.
  final String headersTitleText;

  /// [responseTitleText] is used where the response is displayed. Defaults to
  /// `RESPONSE BODY`.
  final String responseTitleText;

  /// [errorTitleText] is used where the error is displayed. Defaults to
  /// `ERROR BODY`.
  final String errorTitleText;

  /// [noDataYetText] is used when there is no data yet. Defaults to
  ///  `No data (yet)`.
  final String noDataYetText;

  /// [noSearchResultsText] is used when there are no search results. Defaults
  /// to `No search results`.
  final String noSearchResultsText;

  const FancyDioInspectorL10nOptions({
    this.appBarText = FancyStrings.appBarText,
    this.requestsText = FancyStrings.requests,
    this.responsesText = FancyStrings.responses,
    this.errorsText = FancyStrings.errors,
    this.searchHintText = FancyStrings.search,
    this.cURLText = FancyStrings.cURL,
    this.copyText = FancyStrings.copy,
    this.copiedText = FancyStrings.copied,
    this.cURLCopiedText = FancyStrings.cURLCopied,
    this.urlTitleText = FancyStrings.urlTitle,
    this.requestTitleText = FancyStrings.requestTitle,
    this.headersTitleText = FancyStrings.headersTitle,
    this.responseTitleText = FancyStrings.responseTitle,
    this.errorTitleText = FancyStrings.errorTitle,
    this.noDataYetText = FancyStrings.noDataYet,
    this.noSearchResultsText = FancyStrings.noSearchResults,
  });
}
