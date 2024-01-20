import 'package:flutter/material.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/pages/introduction/introduction_page.dart';
import 'package:foodapp/pages/signin/signin_page.dart';
import 'package:foodapp/pages/signup/signup_page.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: "home",
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'introduction',
            name: "introduction",
            builder: (BuildContext context, GoRouterState state) {
              return const IntroductionPage();
            },
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const IntroductionPage(),
                transitionDuration: const Duration(milliseconds: 1000),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: 'signup',
            name: "signup",
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const SignUpPage(),
                transitionDuration: const Duration(milliseconds: 1000),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: 'signin',
            name: "signin",
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const SignInPage(),
                transitionDuration: const Duration(milliseconds: 1000),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
