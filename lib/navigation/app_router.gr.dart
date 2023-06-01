// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:ceiba_app/people/post/screens/post_list_screen.dart' as _i2;
import 'package:ceiba_app/people/users/models/user.dart' as _i5;
import 'package:ceiba_app/people/users/screens/users_list_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    UsersListScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.UsersListScreen(),
      );
    },
    PostListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PostListScreenRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.PostListScreen(
          args.user,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          UsersListScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          PostListScreenRoute.name,
          path: '/posts',
        ),
        _i3.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.UsersListScreen]
class UsersListScreenRoute extends _i3.PageRouteInfo<void> {
  const UsersListScreenRoute()
      : super(
          UsersListScreenRoute.name,
          path: '/',
        );

  static const String name = 'UsersListScreenRoute';
}

/// generated route for
/// [_i2.PostListScreen]
class PostListScreenRoute extends _i3.PageRouteInfo<PostListScreenRouteArgs> {
  PostListScreenRoute({
    required _i5.User user,
    _i4.Key? key,
  }) : super(
          PostListScreenRoute.name,
          path: '/posts',
          args: PostListScreenRouteArgs(
            user: user,
            key: key,
          ),
        );

  static const String name = 'PostListScreenRoute';
}

class PostListScreenRouteArgs {
  const PostListScreenRouteArgs({
    required this.user,
    this.key,
  });

  final _i5.User user;

  final _i4.Key? key;

  @override
  String toString() {
    return 'PostListScreenRouteArgs{user: $user, key: $key}';
  }
}
