import 'package:blinkit_clone/views/app/ui/init_page.dart';
import 'package:blinkit_clone/views/home/ui/home_page.dart';
import 'package:blinkit_clone/views/profile/ui/profile_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) {
      return const InitPage();
    },
    routes: <RouteBase>[
      GoRoute(
        path: "/home_page",
        name: "home_page",
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
          path: "/profile_page",
          name: "profile_page",
          builder: (context, state) {
            return const ProfilePage();
          })
    ],
  ),
]);
