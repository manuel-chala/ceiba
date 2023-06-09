import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigation/app_router.gr.dart';
import 'components/base_component.dart';
import 'providers/global_loading_provider.dart';
import 'theme/providers/theme_provider.dart';
import 'theme/theme.dart';
import 'utils/singletons.dart';

GlobalKey<State<BottomNavigationBar>> bottomNavigationBar = GlobalKey<State<BottomNavigationBar>>();
GlobalKey<NavigatorState> rootNavigatorKey = singleton<AppRouter>().navigatorKey;
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends BaseComponent {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = singleton<AppRouter>();

    return MaterialApp.router(
      title: 'Houston',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      themeMode: ref.watch(themeProvider),
      routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      builder: (context, widget) {
        return Consumer(builder: (context, ref, child) {
          return Stack(
            children: [
              if (ref.watch(globalLoadingProvider))
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              widget!,
            ],
          );
        });
      },
    );
  }
}
