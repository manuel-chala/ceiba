import 'package:auto_route/auto_route.dart';

import '../people/post/screens/post_list_screen.dart';
import '../people/users/screens/users_list_screen.dart';

const List<AutoRoute> appRoutes = [
  AutoRoute(initial: true, path: "/", page: UsersListScreen),
  AutoRoute(initial: true, path: "/posts", page: PostListScreen),
  RedirectRoute(path: '*', redirectTo: '/'),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
