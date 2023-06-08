import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/loggers/fancy_dio_logger.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// A view that displays the network requests, responses and errors.
class FancyDioInspectorView extends StatelessWidget {
  /// The options for the dio tiles.
  /// If this is `null`, the default options will be used.
  final FancyDioInspectorTileOptions tileOptions;

  /// [leading] is used to place a widget before the title.
  final Widget? leading;

  /// [actions] are used to place widgets after the title.
  final List<Widget>? actions;

  const FancyDioInspectorView({
    this.tileOptions = const FancyDioInspectorTileOptions(),
    this.leading,
    this.actions,
    super.key,
  });

  FancyDioLogger get _logger => FancyDioLogger.instance;

  List<NetworkRequestModel> get _requests => _logger.apiRequests;
  List<NetworkResponseModel> get _responses => _logger.apiResponses;
  List<NetworkErrorModel> get _errors => _logger.apiErrors;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Tab(
        text: FancyStrings.requests,
        icon: Icon(Icons.network_check),
      ),
      const Tab(
        text: FancyStrings.responses,
        icon: Icon(Icons.list),
      ),
      const Tab(
        text: FancyStrings.errors,
        icon: Icon(Icons.error),
      ),
    ];

    final tabBarViews = [
      FancyDioTabView(components: _requests, tileOptions: tileOptions),
      FancyDioTabView(components: _responses, tileOptions: tileOptions),
      FancyDioTabView(components: _errors, tileOptions: tileOptions),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Theme(
        data: context.currentTheme,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(FancyStrings.networkTitle),
            bottom: TabBar(tabs: tabs),
            leading: leading,
            actions: actions,
          ),
          body: TabBarView(children: tabBarViews),
        ),
      ),
    );
  }
}
