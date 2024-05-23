import 'package:flutter/material.dart';
import 'package:new_app_drift/library.dart';

import '../modules/contato/pages/contato_page.dart';
import '../modules/counter/counter.dart';
import '../modules/user/pages/user_page.dart';
import '../modules/user/pages/user_page_detail.dart';
import '../modules/user/user.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CounterPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const CounterPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/userlist',
      name: 'userlist',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const UserPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/userdetail',
      name: 'userdetail',
      pageBuilder: (context, state) {
        UserModel sample = state.extra as UserModel;
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: UserDetail(object: sample),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.linearToEaseOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/contato',
      name: 'contato',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ContatoPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    // GoRoute(
    //   path: '/auth',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return LoginPage(
    //       desktopBody: LoginDesktopPage(),
    //       mobileBody: LoginMobilePage(),
    //       key: GlobalObjectKey(Key('loginPage')),
    //       tabletBody: LoginTabletPage(),
    //       title: 'Login',
    //     );
    //   },
    //   routes: <RouteBase>[
    //     GoRoute(
    //       path: 'details',
    //       builder: (BuildContext context, GoRouterState state) {
    //         return CounterPage();
    //       },
    //     ),
    //   ],
    // ),
  ],
);
