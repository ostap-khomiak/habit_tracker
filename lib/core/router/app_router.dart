import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/widgets/main_navigation_page.dart';
import 'package:habit_tracker/feature/habits/presentation/pages/habits_page.dart';
import 'package:habit_tracker/feature/settings/presentation/pages/settings_page.dart';
import 'package:habit_tracker/feature/stats/presentation/pages/stats_page.dart';

import 'router_names.dart';
import 'router_paths.dart';

final router = GoRouter(
  initialLocation: RoutePaths.home,

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationPage(child: child);
      },
      routes: [
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          builder: (context, state) => const HabitsPage(),
        ),

        GoRoute(
          path: RoutePaths.settings,
          name: RouteNames.settings,
          builder: (context, state) => const SettingsPage(),
        ),

        GoRoute(
          path: RoutePaths.stats,
          name: RouteNames.stats,
          builder: (context, state) => const StatsPage(),
        ),
      ],
    ),
  ],
);
