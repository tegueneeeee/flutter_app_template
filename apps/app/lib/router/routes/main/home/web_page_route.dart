part of 'package:flutter_app/router/router.dart';

class WebPageRoute extends GoRouteData {
  const WebPageRoute();

  static const path = 'web';

  static final $parentNavigatorKey = GlobalKeys.rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebPage(initialUrl: 'https://flutter.dev', onPop: context.pop);
  }
}
